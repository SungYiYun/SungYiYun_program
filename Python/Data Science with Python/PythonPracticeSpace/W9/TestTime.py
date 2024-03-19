import time
print(time.gmtime(0))
print(time.gmtime())
print(time.gmtime(time.time()))
print(time.time())

print(time.localtime())
print(time.gmtime())

print(time.strptime('2019-1-1', '%Y-%m-%d'))
d = time.strptime('2019-1-1', '%Y-%m-%d')
print(time.strftime('%Y-%m-%d',d))
print(time.ctime())

print(time.gmtime().tm_wday)