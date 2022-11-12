#include <stdio.h>
#include <cs50.h>
#include <math.h>



int main(void)
{
    // get number from user
    long number = 0;
    do
    {
        number = get_long("number: ");
    }
    while (number <= 0);
    
    int length = 0;
    
    
    
    // sum of the digits that weren’t multiplied by 2
    long x = 0;
    long even = number;
    while (even > 0)
    {
        x = x + even % 10;

        even = even / 100;
        
    }
    
    // sum of the digits that multiplied by 2
    long y = 0;
    long z = 0;
    long odd = number;
    while (odd > 0)
    {
        y = odd / 10 % 10;
        y = y * 2;
        z = z + (y % 10 + y / 10);
        odd = odd / 100;
    }
    
    
    //Add the sum to the sum 
    int sum = x + z;
    
    if (sum % 10 != 0)
    {
        printf("INVALID\n");
        return 0;
    }
    
    
    //check number length
    long digits = number;
    
    while (digits > 0)
    {
        digits = digits / 10;
        length++;
    }
    
    if (length != 13 && length != 15 && length != 16)
    {
        printf("INVALID\n");
        return 0;
        
    }
    
    
    long s = 1;
    for (long i = 0; i < 14; i++)
    {
        s = 10 * s;
    }
    
    
    // MasterCard starting numbers
    int Mastercard = number / s;
    
    if (Mastercard == 55 || Mastercard == 54 || Mastercard == 53 || Mastercard == 52 || Mastercard == 51)
        
        if (length == 16 && sum % 10 == 0)
        {
            printf("MASTERCARD\n");
            return 0;
        }

        
        
    // American Express starting numbers
    int AMEX = number / (s / 10);
    
    if (AMEX == 34 || AMEX == 37)
    
        if (length == 15 && sum % 10 == 0)
        {
            printf("AMEX\n");
            return 0;
        }

    
    
    //  Visa starting numbers
    int Visa = number / (s / 100);
    
    if (Visa / 1000 == 4 || Visa == 4)
    
        if (length == 13 || length == 16)
        
            if (sum % 10 == 0)
            {
                printf("VISA\n");
                return 0;
            }

    printf("INVALID\n");
    return 0;

}
