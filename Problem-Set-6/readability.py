from cs50 import get_string

text = get_string("Text: ")

letters = 0
words = 1
sentences = 0
for char in text:
    if char.isalpha():
        letters += 1
    elif char == ' ':
        words += 1
    elif char in ".?!":
        sentences += 1

L = float(letters / words) * 100.0
S = float(sentences / words) * 100.0

index = (0.0588 * L) - (0.296 * S) - (15.8)
grade = round(index)

if grade < 1:
    print("Before Grade 1")

elif 1 <= grade <= 16:
    print(f"Grade {grade}")

else:
    print("Grade 16+")
