import urllib.request, os

url = "http://uta.pw/shodou/img/28/214.png"
savefilepath = os.path.dirname(os.path.abspath(__file__)) + "/" + "test.png"

png_bin_data = urllib.request.urlopen(url).read()

with open(savefilepath, mode="wb") as f:
    f.write(png_bin_data)
    print("saved {0}!".format(savefilepath))
