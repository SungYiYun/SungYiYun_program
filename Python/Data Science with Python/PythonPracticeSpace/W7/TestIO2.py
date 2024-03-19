with open('Data1.txt', 'w') as data1, open('Data2.txt') as data2:
    print(data1.readable())
    print(data1.writable())
    print(data2.readable())
    print(data2.writable())