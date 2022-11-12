#include <stdio.h>
#include <cs50.h>
#include <math.h>

//FORMAT CODES:
//(%c) - place holder for printing single character
//(%f) - ...for printing floating point values
//(%i) - ...for printing integers
//(%li) - ...for printing long integers
//(%s) - ...for printing strings

//OPERATORS:
//(+) — addition
//(-) — subtraction
//(/) — division
//(*) — multiplication
//(%) — remainder — NOT to be confused with format codes
//(==) — equal to — TWO equal sings to compare values
//(!=) — not equal to

//SYNTACTIC SUGAR (VARIABLES):
//to set counter: [specify datatype] [define counter] [semicolon] - remember
//to set counter example: int counter = 3; - remember, equal sign is the assignment operator
//to set counter increment: [specify datatype] [define counter incrememnt] [semicolon]
//to set counter incrememnt example: int counter++; - the increment will add 1 to our variable

//BOOLEAN EXPRESSION:
//a Boolean expression is a logical statement that is either TRUE or FALSE

//GREEDY ALGORITHM: 
//one “that always takes the best immediate, or local, solution while finding an answer

//KILL COMMAND LINE:
//[control - c]

//int main(void)
//{
//    // Prompt user for change
//    float coins;
//
//    do
//    {
//        coins = get_float("Change owed? $_\n");
//    }
//    while (coins < 0);
//    int cents = round(coins * 100);
//    
//    // Give user change — these variables are "counters," they do not hold nominal value
//    int q = 0; 
//    int d = 0; 
//    int n = 0; 
//    int p = 0;
//    
//    while (cents >= 25)
//    {
//        q++;
//        cents = cents - 25;
//    }
//    while (cents >= 10)
//    {
//        d++;
//        cents = cents - 10;
//    }
//    while (cents >= 5)
//    {
//        n++;
//       cents = cents - 5;
//    }
//    p = cents;
//    printf("You have %d quarters, %d dimes, %d nickels, and %d pennies.\n", q, d, n, p);
//    //printf("You have %i coins.\n", q + d + n + p);
//}

int main(void)

{
    float dollars; //specify conditions && ask for amount
    do
    {
        dollars = get_float("Change owed: ");
    }
    while (dollars < 0); //keep asking while dollars is less than zero
    
    int cents = round(dollars * 100); //rounding our cents
    
    int coins = 0;
    
    while (cents != 0) //while user inputs amnt of cents greater than zero, we will run the program
    {
        //quarters
        coins += cents / 25; //dividing by max amount
        cents %= 25; //carrying the remainder as we go along
        
        //dimes
        coins += cents / 10;
        cents %= 10;
        
        //nickles
        coins += cents / 5;
        cents %= 5;
       
        //pennies
        coins += cents / 1;
        cents %= 1;
    }
    
    printf("%d\n", coins);
}
