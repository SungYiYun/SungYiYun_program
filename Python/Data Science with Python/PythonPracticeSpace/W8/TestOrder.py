s1 = [('A',3),('B',2),('C',1)]
s2 = [('A',3),('B',2),('C',1)]

s1.sort(key=lambda s:s[1])
sorted(s2,key=lambda s:s[1])

print(s1)
print(s2)
print(sorted(s2,key=lambda s:s[1]))

s3 = {('A',3),('B',2),('C',1)}
print(sorted(s3,key=lambda s:s[1]))

from operator import itemgetter
print(sorted(s3,key=itemgetter()))