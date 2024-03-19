s = {1, 2, 3}

s1 = 'ABC'
s2 = 'DEF'

print(s1.__hash__())
#雜湊編碼
print(s2.__hash__())

print(s1.__eq__(s2))


