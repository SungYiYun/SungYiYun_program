def prepend(elem, lt = None):
    lt = lt if lt else []
    lt.insert(0,elem)
    return lt

print(prepend(10))
#print(prepend(10,[20, 30, 40])
#print(prepend(20))