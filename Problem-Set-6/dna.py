import csv
import sys


def main():

    if len(sys.argv) != 3:
        print("Enter Both CSV and Text File")
        sys.exit(1)

    # Reads database file
    try:
        rows = []
        with open(sys.argv[1], "r") as file:
            reader = csv.DictReader(file)
            for row in reader:
                rows.append(row)

    except:
        print("Cant Open CSV File")

    # Reads DNA sequence file
    try:
        dna = []
        with open(sys.argv[2], "r") as txtfile:
            dna = txtfile.read()
    except:
        print("Cant Open Txt File")

    # Find longest match of each STR in DNA sequence

    STRlist = list(rows[0].keys())[1:]

    seq = {}
    for i in STRlist:
        val = longest_match(dna, i)
        seq[i] = val

    # Check database for matching profiles
    for row in rows:
        Matched = True
        for key in seq:
            if seq[key] != int(row[key]):
                Matched = False
                break
        if Matched:
            print(row["name"])
            sys.exit(0)
    print("No match")

    return


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


main()
