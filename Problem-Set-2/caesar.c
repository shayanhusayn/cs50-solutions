#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool only_digits(string s);
char rotate(char c, int k);
char cipher[] = {}; // declared the rotated cipher array

int main(int argc, string argv[])
{
    if (argc == 2) // checks for correct arguments count
    {
        bool result_key = only_digits(argv[1]); // takes bool value for key

        if (result_key == false) // condition if key is flase
        {
            printf("Usage: %s%s\n", argv[0], " key");
            return 1;
        }
        else
        {
            int key = atoi(argv[1]);                 // casting "key" to int
            string text = get_string("plaintext: "); // reads the user's plain text
            int len = strlen(text);                  // length of string text

            for (int i = 0; i < len; i++)
            {
                cipher[i] = rotate(text[i], key); // assigns rotated letters to cipher[]
            }
            cipher[len] = '\0'; // adds null at the end of cipher

            printf("ciphertext: %s\n", cipher); // prints rotated cipher

            return 0;
        }
    }
    else // if argc is not correct
    {
        printf("Usage: %s%s\n", argv[0], " key");
        return 1;
    }
}

bool only_digits(string s)
{
    for (int i = 0, len = strlen(s); i < len; i++)
    {
        if (!isdigit(s[i]))
        {
            return false;
        }
    }

    return true;
}

char rotate(char c, int k)
{
    char changed;
    if (isalpha(c))
    {
        if (isupper(c))
        {
            changed = ((int) c - 'A' + k) % 26; // %26 to wrap around e.g if key is 27
            changed += 'A';
            return changed;
        }
        else
        {
            changed = ((int) c - 'a' + k) % 26;
            changed += 'a';
            return changed;
        }
    }
    else
    {
        return c;
    }
}
