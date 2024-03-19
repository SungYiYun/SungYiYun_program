n,m=6,3
for i in range(1, n+1):
    print(' '*(n-i)+'*'*(2*i-1))
for i in range(3, n+1):
    print(' '*(n-i)+'*'*(2*i-1))
for i in range(m):
    print(' '*((2*n-1-3)//2)+'*'*3)