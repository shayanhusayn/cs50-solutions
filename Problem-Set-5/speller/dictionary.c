// Implements a dictionary's functionality

#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

#include "dictionary.h"

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
} node;

// Number of buckets in hash table
const unsigned int N = 26;

// Hash table
node *table[N];

// Keeps track of number of words loaded
unsigned int wordCount = 0;

// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    int hashIndex = hash(word);
    node *cursor = table[hashIndex];

    while (cursor != NULL)
    {
        if (strcasecmp(word, cursor->word) == 0)
        {
            return true;
        }
        cursor = cursor->next;
    }
    return false;
}

// Hashes word to a number (simple first-letter hash)
unsigned int hash(const char *word)
{
    return toupper(word[0]) - 'A';
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{
    // Initialize table to NULL
    for (int i = 0; i < N; i++)
    {
        table[i] = NULL;
    }

    FILE *src = fopen(dictionary, "r");
    if (src == NULL)
    {
        return false;
    }

    char buffer[LENGTH + 1];
    while (fscanf(src, "%45s", buffer) != EOF)
    {
        node *n = malloc(sizeof(node));
        if (n == NULL)
        {
            fclose(src);
            return false;
        }

        strcpy(n->word, buffer);

        int hashValue = hash(buffer);
        n->next = table[hashValue];
        table[hashValue] = n;

        wordCount++;
    }

    fclose(src);
    return true;
}

// Returns number of words in dictionary if loaded, else 0
unsigned int size(void)
{
    return wordCount;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    for (int i = 0; i < N; i++)
    {
        node *cursor = table[i];
        while (cursor != NULL)
        {
            node *tmp = cursor;
            cursor = cursor->next;
            free(tmp);
        }
        table[i] = NULL;
    }
    return true;
}
