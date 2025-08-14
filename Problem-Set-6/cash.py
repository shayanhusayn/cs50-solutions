from cs50 import get_float

while True:
    cash = get_float("Change: ")
    if cash > 0:
        break


def quarters(cents):
    quarter = 0
    while cents >= 25:
        quarter += 1
        cents -= 25
    return quarter


def dimes(cents):
    dime = 0
    while (cents >= 10):
        dime += 1
        cents -= 10
    return dime


def nickels(cents):
    nickel = 0
    while (cents >= 5):
        nickel += 1
        cents -= 5
    return nickel

def pennies(cents):
    pennie = 0
    while (cents >= 1):
        pennie += 1
        cents -= 1
    return pennie


cents = 100.0 * (cash)
quarter = quarters(cents)
cents -= (quarter * 25)

dime = dimes(cents)
cents -= (dime * 10)

nickel = nickels(cents)
cents -= (nickel * 5)

pennie = pennies(cents)
cents -= (pennie * 1)

total = quarter + dime + nickel + pennie
print(f"{total}")
