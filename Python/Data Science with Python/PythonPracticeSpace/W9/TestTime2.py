import time
from datetime import datetime, date, timedelta,timezone
now = datetime.now()
st = now.timetuple()
print(time.mktime(st))

print(datetime.fromtimestamp(time.mktime(st)))
print(date.fromtimestamp(time.mktime(st)))

print(datetime.now().isoformat())
print(datetime.now().isoformat(' '))

print(date.today().isoformat())

print(datetime.now()+timedelta(weeks=3, days=5))

print(datetime(2019, 4, 1, 20, 52, 15, 0, tzinfo=timezone.utc))
utc = datetime(2019, 4, 1, 20, 52, 15, 0, tzinfo=timezone.utc)
print(utc)
tz = timezone(offset = timedelta(hours=8), name='Asia/Taipei')
print(utc.astimezone(tz))