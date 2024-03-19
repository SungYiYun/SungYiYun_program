import random

number = 0
while number!= 5:
    number = random.randint(1,10)
    print(number)
    if number == 5:
        print('產生5')