import sys
try:
    number = int(sys.argv[1])
    print('100/num',(100/number))
except IndexError as ie:
    print('請輸入參數')
except ValueError as ve:
    print('請輸入數字型態的參數')
except ZeroDivisionError as ze:
    print('請輸入非零數字型態的參數')
except:
    print('發生錯誤')
#IndexError
