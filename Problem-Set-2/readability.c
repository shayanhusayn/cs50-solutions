#include <cs50.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

int count_letters(string text);
int count_words(string text);
int count_sentences(string text);

int main(void)
{
    string text = get_string("Text: ");
    int letters = count_letters(text); // stores return value of count_letters i.e letters
    int words = count_words(text); // stores return value of count_words i.e words
    int sentences = count_sentences(text); //cstores return value of count_sentences i.e sentences

    float L = ((float) letters / (float) words) * 100; // calculates L
    float S = ((float) sentences / (float) words) * 100; // calcualtes S

    float index = (0.0588 * L) - (0.296 * S) - (15.8); // calculates index
    int grade = (int) round(index); // rounds to nearest number and typecast from float to int

    if (grade < 1) // condition for Before Grade 1
    {
        printf("Before Grade 1\n");
    }
    else if (grade >= 1 && grade <= 16) // Prints Grade
    {
        printf("Grade %i\n", grade);
    }
    else // prints for Grade > 16
    {
        printf("Grade 16+\n");
    }
}

int count_letters(string text)
{
    int letters = 0;
    for (int i = 0, len = strlen(text); i < len; i++) // loops through every index i.e length of text
    {
        if (isalpha(text[i])) // checks if currents index has letter
        {
            letters++;
        }
    }
    return letters;
}

int count_words(string text)
{
    int words = 0;
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (text[i] == ' ')
        {
            words++;
        }
    }
    return words + 1;
}

int count_sentences(string text)
{
    int sentences = 0;
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (text[i] == '.' || text[i] == '?' || text[i] == '!')
        {
            sentences++;
        }
    }
    return sentences;
}
