import threading, zipfile

class AsyncZip(threading.Thread):
    def __init__(self, infile, outfile):
        threading.Thread.__init__(self)
        self.infile = infile
        self.outfile = outfile

    def run(self):
        with zipfile.ZipFile(self.outfile, 'w', zipfile.ZIP_DEFLATED) as f:
            f.write(self.infile)
        print('Finished background zip of:', self.infile)

background = AsyncZip('for.py', 'for.py.zip')
background.start()
print('The main program continues to run in foreground.')

background.join() # wait for the background task to finish
print('Main program waited until background was done.')
