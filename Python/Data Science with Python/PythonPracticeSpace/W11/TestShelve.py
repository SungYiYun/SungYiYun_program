import shelve

data = shelve.open('data.shelve')
data['A'] = [1, 2, 3]
data['B'] = [4, 5, 6]
data.close()

data = shelve.open('data.shelve')
data['C'] = [7, 8, 9]
del data['B']
data.sync()
print(list(data))
data.close()