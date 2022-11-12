import os
import re
from typing import cast

from cs50 import SQL
from flask import Flask, flash, redirect, render_template, request, session
from flask_session import Session
from tempfile import mkdtemp
from sqlalchemy.log import instance_logger
from werkzeug.exceptions import default_exceptions, HTTPException, InternalServerError
from werkzeug.security import check_password_hash, generate_password_hash

from helpers import apology, login_required, lookup, usd

from datetime import datetime

now = datetime.now()
print(now.strftime("%H:%M:%S, %d/%m/%Y"))

# Configure application
app = Flask(__name__)

# Ensure templates are auto-reloaded
app.config["TEMPLATES_AUTO_RELOAD"] = True


# Ensure responses aren't cached
@app.after_request
def after_request(response):
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"
    return response


# Custom filter
app.jinja_env.filters["usd"] = usd

# Configure session to use filesystem (instead of signed cookies)
app.config["SESSION_FILE_DIR"] = mkdtemp()
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# Configure CS50 Library to use SQLite database
db = SQL("sqlite:///finance.db")

# Make sure API key is set
if not os.environ.get("API_KEY"):
    raise RuntimeError("API_KEY not set")


@app.route("/")
@login_required
def index():
    """Show portfolio of stocks"""
    user_id = session["user_id"]
    cash = (db.execute("SELECT cash FROM users WHERE id = (?)", user_id))[0]["cash"]
    table = db.execute(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='shares';"
        # "SELECT name FROM sqlite_master WHERE type='table';"
    )
    if len(table) == 1:
        rows = db.execute("SELECT * FROM shares WHERE user_id = (?)", user_id)
        if rows == None:
            print("User's portfolio is currently empty.")
            return render_template("index.html", rows=[], cash=cash)
        else:
            # extract the current price:
            updated_rows = []
            total_val = cash
            for row in rows:
                current = lookup(row["symbol"])
                current_value = current["price"] * row["qty"]
                add = {"price": usd(current["price"]), "val": usd(current_value)}
                new_row = {**row, **add}
                updated_rows.append(new_row)
                total_val += current["price"] * row["qty"]
            return render_template(
                "index.html", rows=updated_rows, cash=usd(cash), total=usd(total_val)
            )
    else:
        return render_template("index.html", rows=[], cash=cash)


@app.route("/buy", methods=["GET", "POST"])
@login_required
def buy():
    """Buy shares of stock"""
    if request.method == "GET":
        return render_template("buy.html", get=True)
    else:
        # check if shares table exists in the database:
        table = db.execute(
            "SELECT name FROM sqlite_master WHERE type='table' AND name='shares';"
        )
        # otherwise, create one:
        if len(table) == 0:
            db.execute(
                "CREATE TABLE shares (user_id INTEGER NOT NULL, qty INTEGER NOT NULL, name TEXT NOT NULL,  symbol TEXT NOT NULL, FOREIGN KEY (user_id) REFERENCES users(id));"
            )
            print("Database for shares is created the first time.")
        else:
            print(f"\n> Table shares already exists; will insert here once successful.")

        order = request.form.get("symbol")
        quote = lookup(order)
        if quote == None or quote == "":
            return apology("Invalid ticker.", 400)

        qty = request.form.get("shares")
        # check for non numeric inputs:
        try:
            int(qty)
            float(qty)
        except:
            return apology("Invalid shares - non-numeric", 400)

        # check for negative inputs:
        if isinstance(qty, float) or float(qty) < 0:
            return apology("Invalid shares.", 400)

        # get user's current cash balance:
        user_id = session["user_id"]
        row = db.execute("SELECT cash FROM users WHERE id = (?)", user_id)
        cash = row[0]["cash"]
        print(f"> Current cash balance is: ${cash}")

        # safe to convert here:
        qty = int(qty)
        # get the recent quote:
        # quote contains: { name, price, symbol}
        cost = quote["price"] * qty
        if cash < cost or cash <= 0:
            print(f"> User has insufficent funds.\n")
            return apology("Insufficent funds", 400)
        else:
            # History Table:
            history = db.execute(
                "SELECT name FROM sqlite_master WHERE type='table' AND name='history';"
            )
            # otherwise, create one:
            if len(history) == 0:
                db.execute(
                    "CREATE TABLE history (user_id INTEGER NOT NULL, type TEXT NOT NULL, qty INTEGER NOT NULL, symbol TEXT NOT NULL, price NUMERIC NOT NULL, date TEXT NOT NULL, FOREIGN KEY (user_id) REFERENCES users(id));"
                )
                print("Database for history is created the first time.")
            else:
                print("History table already in place.")
        # check for exisiting shares:
        existing_shares = db.execute(
            "SELECT qty FROM shares WHERE user_id = (?) AND symbol = (?)",
            user_id,
            quote["symbol"],
        )
        # Update the shares to the user:
        if len(existing_shares) == 1:
            qty += existing_shares[0]["qty"]
            db.execute("UPDATE shares SET qty = (?)", qty)
        else:
            db.execute(
                "INSERT INTO shares (user_id, qty, name, symbol) VALUES (?, ?, ?, ?)",
                user_id,
                qty,
                quote["name"],
                quote["symbol"],
            )

        # deduct the cash amount:
        cash -= cost
        db.execute("UPDATE users SET cash = (?) WHERE id = (?) ", cash, user_id)
        # add to History:
        now = datetime.now()
        db.execute(
            "INSERT INTO history (user_id, qty, type, symbol, price, date) VALUES (?, ?, ?, ?, ?, ?)",
            user_id,
            qty,
            "Buy",
            quote["symbol"],
            quote["price"],
            now.strftime("%H:%M:%S, %d/%m/%Y"),
        )
        print(f"> User purchase successful. Remaining cash: {cash}.\n")
        return redirect("/")


@app.route("/history")
@login_required
def history():
    """Show history of transactions"""
    # check if History table exists in the database:
    table = db.execute(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='history';"
    )
    if len(table) == 1:
        history_data = db.execute(
            "SELECT * FROM history WHERE user_id = (?)", session["user_id"]
        )
        return render_template("history.html", rows=history_data)
    else:
        return render_template("history.html", rows=[])


@app.route("/login", methods=["GET", "POST"])
def login():
    """Log user in"""

    # Forget any user_id
    session.clear()

    # User reached route via POST (as by submitting a form via POST)
    if request.method == "POST":
        username = request.form.get("username")
        pw = request.form.get("password")
        # Ensure username was submitted
        if username == None or username == "":
            return apology("must provide username", 400)

        # Ensure password was submitted
        elif pw == None or pw == "":
            return apology("must provide password", 400)

        # Query database for username
        rows = db.execute(
            "SELECT * FROM users WHERE username = ?", request.form.get("username")
        )

        if len(rows) != 1:
            return apology("User not found", 400)
        # Ensure username exists and password is correct
        if not check_password_hash(rows[0]["hash"], pw):
            return apology("invalid username and/or password", 400)

        # Remember which user has logged in
        session["user_id"] = rows[0]["id"]

        # Redirect user to home page
        return redirect("/")

    # User reached route via GET (as by clicking a link or via redirect)
    else:
        return render_template("login.html")


@app.route("/logout")
def logout():
    """Log user out"""

    # Forget any user_id
    session.clear()

    # Redirect user to login form
    return redirect("/")


@app.route("/quote", methods=["GET", "POST"])
@login_required
def quote():
    """Get stock quote."""
    if request.method == "GET":
        return render_template("quote.html", get=True)
    else:
        # extract input:
        sym = request.form.get("symbol")
        quote = lookup(sym)
        # added additonal layer of redundancy
        if sym == None or sym == "" or quote == None:
            return apology("Invalid symbol (cannot be empty)", 400)
        else:
            # call the API fpr the required data using lookup:
            quote["price"] = usd(quote["price"])
            get = "error" if quote == None else quote
            code = 400 if quote == None else 200
            return render_template("quote.html", get=get), code


@app.route("/register", methods=["GET", "POST"])
def register():
    """Register user"""
    if request.method == "GET":
        try:
            if session["user_id"] != None:
                return render_template("register.html", successful="change")
        except:
            return render_template("register.html")

        return render_template("register.html")
    else:
        # extract inputs:
        username = request.form.get("username")
        password = request.form.get("password")
        confirmation = request.form.get("confirmation")
        # added additonal layer of redundancy
        if password != confirmation:
            return apology("Passwords do not match.", 400)
        elif username == None or username == "" or password == None or password == "":
            return apology("Invalid username (cannot be empty)", 400)
        # check if username alread exists:
        row = db.execute("SELECT * FROM users WHERE username = (?)", username)
        if len(row) > 0:
            print("Username already exists.")
            return apology("Username already exists.", 400)
        else:
            # insert to database:
            entry = db.execute(
                "INSERT INTO users (username, hash) VALUES (?, ?)",
                username,
                generate_password_hash(password),  # don't forget to hash
            )
            if entry:
                print(print("Registration successful."))
                return render_template("/register.html", successful=True)
            else:
                return apology("Oops! Something went wrong.)", 503)


@app.route("/sell", methods=["GET", "POST"])
@login_required
def sell():
    """Sell shares of stock"""
    if request.method == "GET":
        try:
            symbols = db.execute(
                "SELECT symbol FROM shares WHERE user_id = (?)", session["user_id"]
            )
        except:
            symbols = []

        return render_template("sell.html", rows=symbols)
    else:
        user_id = session["user_id"]
        symbol = request.form.get("symbol")
        sell_qty = request.form.get("shares")

        try:
            int(sell_qty)
            float(sell_qty)
        except:
            return apology("Invalid request", 400)

        if symbol == None or symbol == "" or sell_qty == "":
            return apology("Invalid Stock", 400)
        else:
            shares = db.execute(
                "SELECT * FROM shares WHERE user_id = (?) AND symbol = (?)",
                user_id,
                symbol,
            )
            if len(shares) == 1:
                qty = shares[0]["qty"]
                sell_qty = int(sell_qty)

                # insufficient shares:
                if sell_qty <= 0 or sell_qty > qty:
                    return apology("Invalid request - 0, negative or insufficient", 400)

                if shares[0]["symbol"] == symbol and qty > sell_qty:
                    rem = qty - sell_qty
                    # deduct the shares:
                    db.execute(
                        "UPDATE shares SET qty = (?) WHERE user_id = (?) AND symbol = (?)",
                        rem,
                        user_id,
                        symbol,
                    )
                elif shares[0]["symbol"] == symbol and shares[0]["qty"] == sell_qty:
                    # delete stocks from shares
                    db.execute(
                        "DELETE FROM shares WHERE user_id = (?) AND symbol = (?)",
                        user_id,
                        symbol,
                    )
                else:
                    return apology("Invalid request", 400)
                # update cash
                curr_price = lookup(symbol)
                proceeds = sell_qty * curr_price["price"]
                db.execute(
                    "UPDATE users SET cash = cash + (?) WHERE id = (?)",
                    proceeds,
                    user_id,
                )
                # update history
                now = datetime.now()
                db.execute(
                    "INSERT INTO history (user_id, qty, type, symbol, price, date) VALUES (?, ?, ?, ?, ?, ?)",
                    user_id,
                    sell_qty,
                    "Sell",
                    symbol,
                    curr_price["price"],
                    now.strftime("%H:%M:%S, %d/%m/%Y"),
                )
                return redirect("/")
            else:
                return apology("Invalid Shares", 400)


def errorhandler(e):
    """Handle error"""
    if not isinstance(e, HTTPException):
        e = InternalServerError()
    return apology(e.name, e.code)


# Listen for errors
for code in default_exceptions:
    app.errorhandler(code)(errorhandler)