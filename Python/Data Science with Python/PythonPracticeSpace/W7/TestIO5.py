with open('Data1.txt', 'rb') as data1:
    print(data1.tell())
    print(data1.read())
    print(data1.tell())
    #b'123\r\n456'
    #print(data1.seek(0))
    #print(data1.read())