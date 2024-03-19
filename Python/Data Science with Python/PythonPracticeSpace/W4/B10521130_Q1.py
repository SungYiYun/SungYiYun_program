import random

number = random.randint(1,10)
num1 = 0
while num1 != number:
    num1 = int(input("請猜謎底數字是："))
    if num1 > number:
        print("請猜小一點")
    elif num1 < number:
        print("請猜大一點")
    else:
        print("恭喜您猜中了")

