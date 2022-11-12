#include <stdio.h>
#include <stdlib.h>
#include <cs50.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

int main(int argc, string argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    int key = atoi(argv[1]);
    int realKey = key % 26;

    string input = get_string("plaintext: ");
    int inputLength = strlen(input);

    int resultArray[inputLength];

    printf("ciphertext: ");
    for (int i = 0; i < inputLength; i++)
    {
        if (isalpha(input[i]))
        {
            int charDecimal = (int) input[i];

            if (charDecimal > 64 && charDecimal < 91)
            {
                if (charDecimal + realKey > 90)
                {
                    printf("%c", (char) charDecimal - 26 + realKey);
                }
                else
                {
                    printf("%c", (char) charDecimal + realKey);
                }
            }
            else if (charDecimal > 96 && charDecimal < 123)
            {
                if (charDecimal + realKey > 122)
                {
                    printf("%c", (char) charDecimal - 26 + realKey);
                }
                else
                {
                    printf("%c", (char) charDecimal + realKey);
                }
            }
        }
        else
        {
            printf("%c", input[i]);
        }
    }
    printf("\n");
    return 0;
}
