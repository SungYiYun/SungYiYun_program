str1 = input("請輸入第1個字串：")
str2 = input("請輸入第2個字串：")
str3 = str1 + str2
print("字串相加結果：", str3)
num1 = int(input("請輸入索引切片值："))
str4 = str3[:num1]
num2 = len(str3) - num1
str5 = str3[num2:]
#print(str4)
#print(str5)
print("第1個字串是小寫：", str4.islower())
print("第2個字串是小寫：", str5.islower())
