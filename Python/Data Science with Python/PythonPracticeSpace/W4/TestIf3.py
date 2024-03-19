score = int(input('請輸入成績：'))

if score >= 90 :
    print('得到A')
elif 90 > score >= 80 :
    print('得到B')
elif 80 > score >= 70 :
    print('得到C')
elif 70 > score >= 60 :
    print('得到D')
else:
    print('得到F')