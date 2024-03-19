with open('Data1.txt', 'r') as data1, open('Data2.txt','w') as data2:
    data1_str = data1.read()
    print(data1_str)
    data2.write(data1_str)