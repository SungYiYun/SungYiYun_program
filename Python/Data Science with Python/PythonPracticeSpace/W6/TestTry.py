try:
    numbers = input('請輸入數字：').split(' ')
    print('平均', sum(int(n) for n in numbers)/len(numbers))
except ValueError as ve:
    print(ve)