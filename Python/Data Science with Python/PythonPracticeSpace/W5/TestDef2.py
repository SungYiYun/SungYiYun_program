def gcd(m,n):
    if n == 0:
        return m
    else:
        return gcd(n, m%n)

n1 = int(input("請輸入第1個數字："))
n2 = int(input("請輸入第2個數字："))
r = gcd(n1,n2)
print("兩個數字互質" if r == 1 else "最大公因數" + str(r))
