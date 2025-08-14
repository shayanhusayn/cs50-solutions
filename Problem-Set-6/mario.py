while True: # works like do-while until breaks
    try:
        h = int(input("Height: "))
        if h in range(1, 9): # checks if h is in 1-8
            break
    except:
        pass # null statement

for i in range(h): # rows
    print(" " * (h - (i + 1)), end="") # gives spaces
    for j in range(i + 1): # column
        print("#", end="")
    print() # \n
