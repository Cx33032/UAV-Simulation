from flask import Flask, render_template, redirect
import os, sys, time
now_dir = os.getcwd()
sys.path.append(now_dir) # Add the working directory to the path
from Movements.path import *

app = Flask(__name__)
# 

@app.route('/', methods=['GET', 'POST'])
def home():
    return render_template('./index.html')

@app.route('/air/', methods=['GET', 'POST'])
def air():
    return render_template('takeoff.html')

@app.route('/takeoff/', methods=['GET', 'POST'])
def takeoff():
    print('takeoff')
    time.sleep(1)
    return redirect('/air/')

@app.route('/land/', methods=['GET', 'POST'])
def land():
    print('land')
    time.sleep(1)
    return redirect('/')

@app.route('/forward/', methods=['GET', 'POST'])
def forward():
    print('forward')
    time.sleep(1)
    return redirect('/air/')

@app.route('/backward/', methods=['GET', 'POST'])
def backward():
    print('backward')
    time.sleep(1)
    return redirect('/air/')

@app.route('/left/', methods=['GET', 'POST'])
def left():
    print('left')
    time.sleep(1)
    return redirect('/air/')

@app.route('/right/', methods=['GET', 'POST'])
def right():
    print('right')
    time.sleep(1)
    return redirect('/air/')

@app.route('/spiral/', methods=['GET', 'POST'])
def spiral():
    draw()
    move_test()
    return redirect('/air/')

if __name__ == '__main__':
    app.run(debug=True)
