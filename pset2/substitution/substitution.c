#include <stdio.h>
#include <cs50.h>
#include <string.h>
#include <ctype.h>


int main(int argc, string argv[])
{
    // Checks if command line argument is provided
    if (argc != 2)
    {
        printf("Usage: ./substitution key\n");
        return 1;
    }
    
    int key_length = strlen(argv[1]);

    // Checks if 26 characters are provided
    if (key_length != 26)
    {
        printf("Key must contain 26 characters.\n");
        return 1;
    }
    
// Checks if digits are not present in given argument
    for (int i = 0; i < key_length; i++)
    {
        if (isalpha(argv[1][i]) == false)
        {
            printf("Key must only contain alphabetic characters\n");
            return 1;
        }
        // Checks that there are no repeated characters
        for (int j = i + 1; j < key_length; j++)
        {
            if (toupper(argv[1][j]) == toupper(argv[1][i]))
            {
                printf("Key must not contain repeated characters.\n");
                return 1;
            }
        }
    }

    string plaintext = get_string("plaintext: ");

    printf("ciphertext: ");

    // Enciphers the given plaintext into ciphertext using given key
    for (int i = 0, n = strlen(plaintext); i < n ; i++)
    {
        // Enciphers uppercase letters
        if (isupper(plaintext[i]))
        {
            char ciphered_letter = toupper(argv[1][plaintext[i] - 65]);
            printf("%c", ciphered_letter);
        }
        // Enciphers lowercase letters
        else if (islower(plaintext[i]))
        {
            char ciphered_letter = tolower(argv[1][plaintext[i] - 97]);
            printf("%c", ciphered_letter);
        }
        // Prints non-alphabetical letters as is
        else
        {
            printf("%c", plaintext[i]);
        }
    }
    printf("\n");
    return 0;
}