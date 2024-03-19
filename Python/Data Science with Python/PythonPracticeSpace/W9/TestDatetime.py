from datetime import datetime, date, time

d = date(2019, 4, 1)
print(d.year, d.month, d.day)

t = time(20, 42, 35)
print(t.hour, t.minute, t.second, t.microsecond)

dt = datetime(2019, 4, 1, 20, 42, 35)

print(dt.year, dt.month, dt.day)
print(dt.hour, dt.minute, dt.second, dt.microsecond)

print(datetime.today())
print(datetime.now())
print(date.today())
print(datetime.utcnow())