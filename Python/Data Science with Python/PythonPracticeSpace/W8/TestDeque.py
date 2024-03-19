from collections import deque
d = deque([1,2,3])

d.appendleft(0)
d.appendleft(-1)
d.append(4)
print(d)

print(d.pop())
