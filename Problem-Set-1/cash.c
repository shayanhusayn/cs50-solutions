#include <cs50.h>
#include <stdio.h>

int calculate_quarters(int cents);
int calculate_dimes(int cents);
int calculate_nickels(int cents);
int calculate_pennies(int cents);

int main(void)
{
    int total = 0;
    int cents;
    do
    {
        cents = get_int("Change owed: ");
    }
    while (cents < 0);
    int quarters = calculate_quarters(cents);
    cents = cents - (quarters * 25); // Subtract the value of those quarters from cents
    int dimes = calculate_dimes(cents);
    cents = cents - (dimes * 10); // Subtract the value of those dimes from cents
    int nickels = calculate_nickels(cents);
    cents = cents - (nickels * 5); // Subtract the value of those nickels from cents
    int pennies = calculate_pennies(cents);
    cents = cents - (pennies * 1); // Subtract the value of those pennies from cents

    total = quarters + dimes + nickels + pennies;
    printf("%d\n", total);
}

int calculate_quarters(int cents)
{
    // Calculate how many quarters you should give customer
    int quarters = 0;
    while (cents >= 25)
    {
        quarters++;
        cents = cents - 25;
    }
    return quarters;
}

int calculate_dimes(int cents)
{
    // Calculate how many dimes you should give customer
    int dimes = 0;
    while (cents >= 10)
    {
        dimes++;
        cents = cents - 10;
    }
    return dimes;
}

int calculate_nickels(int cents)
{
    // Calculate how many nickels you should give customer
    int nickels = 0;
    while (cents >= 5)
    {
        nickels++;
        cents = cents - 5;
    }
    return nickels;
}

int calculate_pennies(int cents)
{
    // Calculate how many quarters you should give customer
    int pennies = 0;
    while (cents >= 1)
    {
        pennies++;
        cents = cents - 1;
    }
    return pennies;
}
