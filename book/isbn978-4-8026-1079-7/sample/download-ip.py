import urllib.request

url = "http://api.aoikujira.com/ip/ini"
response_data = urllib.request.urlopen(url).read()

text = response_data.decode("utf-8")
print(text)
