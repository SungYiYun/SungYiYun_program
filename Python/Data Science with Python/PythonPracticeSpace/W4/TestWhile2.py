m = int(input('第一個數字'))
n = int(input('第二個數字'))

while n!=0:
    r = m % n
    m = n
    n = r

if m == 1:
    print('互質')
else:
    print('最大公因數',m)
