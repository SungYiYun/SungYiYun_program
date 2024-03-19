number = int(input('請輸入一個數字'))

if number%2 :
    print(number, '是奇數')
else:
    print(number, '是偶數')


print(number,'是奇數' if number%2 else '是偶數')
