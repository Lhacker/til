from datetime import datetime, timezone, timedelta

now = datetime.now()
print(now)

# get JST datetime
JST = timezone(timedelta(hours=+9), 'JST')
d = datetime.fromtimestamp(now.timestamp(), JST)

print(d.strftime("%Y/%m/%d %H:%M:%S"))
