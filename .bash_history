cd Lab2
mkdir scrabble
cd scrabble
wget https://cdn.cs50.net/2020/fall/labs/2/scrabble.c
style50 scrabble.c
check50 cs50/labs/2021/x/scrabble
submit50 cs50/labs/2021/x/scrabble
mkdir
mkdir week2
mkdir readability
cd readability/
touch readability.
touch readability.c
style50 readability.c
./readability
check50 cs50/problems/2021/x/readability
./readability
make readability
submit50 cs50/problems/2021/x/readability
mkdir caesar
cd caesar/
touch caesar.c
style50 caesar.c
./caesar 13
check50 cs50/problems/2021/x/caesar
submit50 cs50/problems/2021/x/caesar
mkdir substitution
cd substitution/
touch substitution.c
style50 substitution.c
./substitution JTREKYAVOGDXPSNCUIZLFBMWHQ
check50 cs50/problems/2021/x/substitution
submit50 cs50/problems/2021/x/substitution
cd Substitution/
cd substitution/
style50 substitution.c
check50 cs50/problems/2021/x/substitution
submit50 cs50/problems/2021/x/substitution
mkdir plurality
cd plurality/
touch plurality.c
mkdir pest3
cd pest3/
mkdir plurality
cd plurality/
touch plurality.c
style50 plurality.c
check50 cs50/problems/2021/x/plurality
style50 plurality.c
check50 cs50/problems/2021/x/plurality
style50 plurality.c
check50 cs50/problems/2021/x/plurality
submit50 cs50/problems/2021/x/plurality
cd pest3
mkdir runoff
cd runoff/
touch runoff.c
style50 runoff.c
check50 cs50/problems/2021/x/runoff
submit50 cs50/problems/2021/x/runoff
cd pest3
mkdir tideman
cd tideman/
touch tideman.c
style50 tideman.c
check50 cs50/problems/2021/x/tideman
submit50 cs50/problems/2021/x/tideman
mkdir pest4
cd pest4/
mkdir Filter
cd Filter/
touch Filter.c
mkdir pset4
cd pest4/
mkdir pest4
cd pest4
mkdir filter.less
cd filter.less/
touch filter.less.c
style50 helpers.c
check50 cs50/problems/2021/x/filter/less
mkdir pest4
cd pest4
mkdir images
cd images
mkdir filter
cd filter
touch filter.c
style50 helpers.c
check50 cs50/problems/2021/x/filter/less
/home/ubuntu/pest4/images/filter
check50 cs50/problems/2021/x/filter/less
cd pest4
mkdir filter
cd filter
mkdir images
cd images
touch filter.c
touch helpers.c
cd filter
cd pest4
cd filter
touch filter.c
touch helpers.c
#include "helpers.h"
#include "math.h"
#include "stdlib.h"
#include "stdio.h"
#include "string.h"
#include "cs50.h"
int resolveSepiaValue(float value);
// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{     for (int i = 0; i < height; i++)
}
// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{     for (int i = 0; i < height; i++)
}
// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{     RGBTRIPLE copy[height][width];     for (int i = 0; i < height; i++)
}
// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{     RGBTRIPLE output[height][width];     memcpy(output, image, sizeof(RGBTRIPLE) * height * width);
}
// Gets the apropriate sepia value
int resolveSepiaValue(float value)
{     int _sepia = round(value);
cd pest4
cd filter
cd filter.c
check50 cs50/problems/2021/x/filter/less
style50 helpers.c
check50 cs50/problems/2021/x/filter/less
submit50 cs50/problems/2021/x/filter/less
make filter
cd mario.c
cd mario.c/
touch mario.c
style50 mario.c
cd pest1
cd pest1/
make mario
check50 cs50/problems/2021/x/filter/more
cd helpers.c/
cd pest4
cd filter
cd images
mkdir bmp
mkdir bmp.h/
touch bmp.h
touch helpers.c
touch helpers.h
cd pest4
cd filter
cd images
cd helpers.c
cd helpers.c/
check50 cs50/problems/2021/x/filter/more
submit50 cs50/problems/2021/x/filter/more
cd recover.c/
touch recover.c/
mkdir recover.c
cd images
cd filter
cd pest4
cd filter
cd images
touch recover.c
check50 cs50/problems/2021/x/recover
submit50 cs50/problems/2021/x/recover
cd pest4
cd filter
cd images
touch volume.c
check50 cs50/labs/2021/x/volume
submit50 cs50/labs/2021/x/volume
cd pest4
mkdir recover
mkdir volume
mkdir lab1
mkdir lab2
mkdir lab3
mkdir lab4
cd lab3
touch answers.txt
sort1 uses: Bubble Sort
How do you know?: I checked the time for the least amount of data in the sorted state based on omega.
sort2 uses: Merge Sort
How do you know?: I checked the time for the least amount of data in the sorted state based on omega.
sort3 uses: Selection Sort
cd lab3
check50 cs50/labs/2021/x/sort
submit50 cs50/labs/2021/x/sort
mkdir lab5
cd lab5
touch inheritance.c
check50 cs50/labs/2021/x/inheritance
submit50 cs50/labs/2021/x/inheritance
mkdir pest5
cd pest5
touch dictionary.c
touch speller.c
touch dictionary.h
$ check50 cs50/problems/2021/x/speller
cd dictionary.c
cd dictionary.c/
cd pest5
#include <stdbool.h>
#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>
#include "dictionary.h"
#include <string.h>
#include <strings.h>
int counter = 0;
// Represents a node in a hash table
typedef struct node
{     char word[LENGTH + 1];     struct node *next; }
node;
cd pest5
$ check50 cs50/problems/2021/x/speller
cd pest5
mkdir speller
mkdir speller/
cd speller
mkdir dictionary
cd dictionary
touch dictionary.c
$ check50 cs50/problems/2021/x/speller
cd speller
style50 dictionary.c
submit50 cs50/problems/2021/x/speller
mkdir lab6
cd lab6
touch tournament.py
check50 cs50/labs/2021/x/worldcup
submit50 cs50/labs/2021/x/worldcup
mkdir pset6
cd pset6
touch hello.py
check50 cs50/problems/2021/x/sentimental/hello
submit50 cs50/problems/2021/x/sentimental/hello
mkdir hello
mkdir mario less
mkdir marioL
cd marioL
touch marioL.py
check50 cs50/problems/2021/x/sentimental/mario/less
cd pest5
cd pset6
check50 cs50/problems/2021/x/sentimental/mario/less
submit50 cs50/problems/2021/x/sentimental/mario/less
mkdir marioL
touch mario.py
check50 cs50/problems/2021/x/sentimental/mario/more
submit50 cs50/problems/2021/x/sentimental/mario/more
mkdir marioM
touch cash.py
from cs50 import get_float
c = 0
# Get owe...
print("Write down the amount you owe to calculate the number of coins like ($.¢)... ")
o = 0
while True:;     o = get_float("Owed: ")
# Quarter.
while 25 <= ce:;     ce -= 25;     c += 1
while 10 <= ce:;     ce -= 10;     c += 1
while 5 <= ce:;     ce -= 5;     c += 1
while 1 <= ce:;     ce -= 1;     c += 1
cd pset6
check50 cs50/problems/2021/x/sentimental/cash
submit50 cs50/problems/2021/x/sentimental/cash
mkdir cash
touch credit.py
check50 cs50/problems/2021/x/sentimental/credit
style50 credit.py
check50 cs50/problems/2021/x/sentimental/credit
submit50 cs50/problems/2021/x/sentimental/credit
mkdir credit
touch readability.py
from sys import exit
# Get Text...
text = input("Text: ")
# Variables...
h = 0
s = 0
l = 0
c = 0
k = 1
sat = 0
# Check and count...
for i in range(len(text)):
s = (sat / k) * 100.0
c = 0.0588 * l - 0.296 * s - 15.8
# Results...
if c < 1:;     print("Before Grade 1")
if c > 16:;     print("Grade 16+")
c = round(c)
# End :)
print(f"Grade {int(c)}")
cd pset6
check50 cs50/problems/2021/x/sentimental/readability
submit50 cs50/problems/2021/x/sentimental/readability
mkdir readability
touch dna.py
check50 cs50/problems/2021/x/dna
submit50 cs50/problems/2021/x/dna
cd pset6
mkdir dna
mkdir lab7
cd lab7
touch 1.sql
touch 2.sql
touch 3.sql
touch 4.sql
touch 5.sql
touch 6.sql
touch 7.sql
touch 8.sql
touch songs.sql
check50 cs50/labs/2021/x/songs
touch songs.sql
submit50 cs50/labs/2021/x/songs
pset7
cd pset5
cd speller
touch Makefile
touch dictionary.h
touch speller.c
mkdir pset7
cd pset7
touch 1.sql
touch 2.sql
touch 3.sql
touch 4.sql
touch 5.sql
touch 6.sql
touch 7.sql
touch 8.sql
touch 9.sql
touch 10.sql
touch 1.sql
touch 11.sql
touch 13.sql
touch 12.sql
mkdir movies
cd movies
touch movies.db
check50 cs50/problems/2021/x/movies
touch movies.sql
check50 cs50/problems/2021/x/movies
submit50 cs50/problems/2021/x/movies
cd pset7
mkdir fiftyville
cd fiftyville
touch answers.txt
touch log.sql
check50 cs50/problems/2021/x/fiftyville
submit50 cs50/problems/2021/x/fiftyville
cd lab7
check50 cs50/labs/2021/x/songs
submit50 cs50/labs/2021/x/songs
mkdir lab8
cd lab8
touch index.html
touch styles.css
submit50 cs50/labs/2021/x/trivia
mkdir lab9
cd lab9
touch application.py
import os
from cs50 import SQL
from flask import Flask, flash, jsonify, redirect, render_template, request, session
# Configure application
app = Flask(__name__)
# Ensure templates are auto-reloaded
app.config["TEMPLATES_AUTO_RELOAD"] = True
# Configure CS50 Library to use SQLite database
db = SQL("sqlite:///birthdays.db")
@app.route("/", methods=["GET", "POST"])
def index():
cd lab9
mkdir templates
cd templates
touch index.html
cd lab9
back
cd lab9
mkdir static
cd static
touch styles.css
submit50 cs50/labs/2021/x/birthdays
mkdir pset9
cd pset9
touch requirements.txt
touch helpers.py
touch application.py
mkdir templates
cd templates
touch sell.html
touch register.html
touch quoted.html
touch quote.html
touch login.html
touch layout.html
touch index.html
touch history.html
touch buy.html
touch apology.html
cd lab9
mkdir static
cd pset9
mkdir static
cd static
touch favicon.ico
touch styles.css
submit50 cs50/problems/2021/x/finance
cd pset9
submit50 cs50/problems/2021/x/finance
touch finance.db
submit50 cs50/problems/2021/x/finance
touch README.md
mkdir __pycache__
cd __pycache__
cd pset9
mkdir pycache
cd pycache
touch helpers.cpython-39.pyc
cd pset9
submit50 cs50/problems/2021/x/finance
cd pycache
helpers.cpython-39.pyc
touch helpers.cpython-39.pyc
submit50 cs50/problems/2021/x/finance
cd pset9
submit50 cs50/problems/2021/x/finance
mkdir workings
touch func-test.py
cd workings
touch func-test.py
def main():
def lookup(symbol):
cd pset9
cd workings
touch dict-test.py
touch check-type.py
shares = ["abc", "23", "21av", "1.24", "-3", ""]
for i in range(len(shares)):
cd pset9
submit50 cs50/problems/2021/x/finance
cd pycache
submit50 cs50/problems/2021/x/finance
cd pset9
submit50 cs50/problems/2021/x/finance
mkdir pset8
touch projects.html
cd pset8
touch projects.html
touch index.html
touch contact.html
touch about.html
mkdir css
cd css
touch style.css
mkdir scss
cd scss
touch style.scss
touch _projects.scss
touch _index.scss
touch _generic.scss
touch _contact.scss
touch _about.scss
.about {
cd pset8
cd css
style.css
cd style.css
touch style.css
cd pset8
mkdir img
cd img
touch project.svg
touch linkendin.svg
touch github.svg
touch facebook.svg
touch Eu-home.svg
touch Eu-about.svg
touch projects.html
touch project.svg
cd pset8
submit50 cs50/problems/2021/x/homepage
cd pset9
touch .gitignore
submit50 cs50/problems/2021/x/finance
mkdirrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
cd pset9
submit50 cs50/problems/2021/x/finance
