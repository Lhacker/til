from flask import Flask, session, redirect, url_for, escape, request
import os
app = Flask(__name__)

@app.route('/')
def index():
    if 'username' in session:
        return 'Logged in as %s' % escape(session['username'])
    return 'You are not logged in'

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        session['username'] = request.form['username']
        return redirect(url_for('index'))
    return '''
        <form action="" method="post">
          <p><input type="text" name="username" /></p>
          <p><input type="submit" value="Login" /></p>
        </form>
    '''

@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('index'))

app.secret_key = os.urandom(24)

if __name__ == '__main__':
    app.run(debug=True)
