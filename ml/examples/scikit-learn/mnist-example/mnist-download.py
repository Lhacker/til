import urllib.request as req
import gzip, os, os.path

savepath = './mnist'
baseurl = 'http://yann.lecun.com/exdb/mnist'

files = [
    'train-images-idx3-ubyte.gz',
    'train-labels-idx1-ubyte.gz',
    't10k-images-idx3-ubyte.gz',
    't10k-labels-idx1-ubyte.gz'
]

if not os.path.exists(savepath):
    os.mkdir(savepath)
for f in files:
    fileurl = baseurl + '/' + f
    loc = savepath + '/' + f
    print('download: ', fileurl)
    if not os.path.exists(loc):
        req.urlretrieve(fileurl, loc)

# gzip extract
for f in files:
    gz_file = savepath + '/' + f
    raw_file = savepath + '/' + f.replace('.gz', '')
    print('gzip extracting... ', f)
    with gzip.open(gz_file, 'rb') as fp:
        body = fp.read()
        with open(raw_file, 'wb') as w:
            w.write(body)

print('finished.')
