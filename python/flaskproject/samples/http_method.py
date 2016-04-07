from flask import Flask, request, redirect, url_for
app = Flask(__name__)

@app.route('/')
def index():
    return 'index page'

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        return do_the_login()
    else:
        return show_the_login_form()

def do_the_login():
    return 'logined!'

def show_the_login_form():
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
