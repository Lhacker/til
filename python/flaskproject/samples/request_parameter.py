from flask import Flask, request
app = Flask(__name__)

# > http://localhost:5000/?q=hoge
@app.route('/')
def index():
    q = request.args.get('q', '')
    return 'index page, request parameter: %s' % q

if __name__ == '__main__':
    app.run(debug=True)
