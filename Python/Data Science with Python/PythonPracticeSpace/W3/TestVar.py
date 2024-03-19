x = 10
y = x
print(x)
print(y)
print(id(x))
print(id(y))

y = 20
print(x)
print(y)
print(id(x))
print(id(y))

a = [1, 2, 3]
b = a
b[1] = 20
print(a)
del a
#print(a)
print(b)