#include <stdio.h>
#include <stdlib.h>
#include <cs50.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
//takes user input as a string
//counts number of letters in string (src_txt)
//counts number of words in string
//counts number of sentences in string
//computes the coleman liau index and outputs grade level to user

void liau_text(string s);

int main(void)
{
    string src_text = get_string("Text: ");
    liau_text(src_text);
}

//liau text counts letters, words, and sentences and then performs the coleman liau formula
void liau_text(string s)
{
    //declare count variables for coleman liau formula
    float letter_count = 0;
    float word_count = 1;
    float sentence_count = 0;
    int liau_index = 0;
    string liau_grade = " ";
    for (int i = 0, n = strlen(s); i < n; i++)
    {
        //is alpha checks if the letter is alphanumeric and creates overall letter count
        if (isalpha(s[i]))
        {
            letter_count++;
        }
        //is space checks if there are spaces or tabs between words and creates overall word count
        if (isspace(s[i]))
        {
            word_count++;
        }
        //following condition creates overall sentence count by checking for end-sentence punctuation
        if (s[i] == '.' || s[i] == '?' || s[i] == '!')
        {
            sentence_count++;
        }
    }
    //following two lines create averages per 100 words
    float avg_letter = (letter_count / word_count) * 100.0;
    float avg_word = (sentence_count / word_count) * 100.0;
    //liau_index is our final number which is rounded and cast to an int and printed to the user
    liau_index = (int)round(0.0588 * avg_letter - 0.296 * avg_word - 15.8);
    if (liau_index > 16)
    {
        printf("Grade 16+\n");
    }
    else if (liau_index < 1)
    {
        printf("Before Grade 1\n");
    }
    else
    {
        printf("Grade %i\n", liau_index);
    }
}
