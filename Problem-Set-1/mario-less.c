#include <cs50.h>
#include <stdbool.h> // so, we can use bool flag for spaces
#include <stdio.h>

int main(void)
{
    int n;

    do
    {
        n = get_int("Height: ");
        for (int row = 0; row <= n; row++) // the row loop
        {
            bool spaces = false;                // need to initialize spaces after every loop cycle
            for (int col = 0; col < row; col++) // the col loop
            {
                if (!spaces) // check if there is already spaces for current line
                {
                    for (int i = 0; i < n - row;
                         i++) // give spaces based on (n-row), dont need space for last line
                    {
                        printf(" ");
                        spaces = true; // changes the bool flag
                    }
                }
                printf("#");
            }
            printf("\n"); // gives new line after inner loop(s) i.e makes rows
        }
    }
    while (n < 1 || n > 8);
}
