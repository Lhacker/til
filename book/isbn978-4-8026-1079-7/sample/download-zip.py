import urllib.request
import urllib.parse

ZIP_SEARCH_API = "http://api.aoikujira.com/zip/xml/get.php"

params = urllib.parse.urlencode({
    'fmt': 'xml',
    'zn': '1500042'
})

url = ZIP_SEARCH_API + "?" + params
print("url=", url)

encoded_data = urllib.request.urlopen(url).read()
text = encoded_data.decode("utf-8")
print(text)
