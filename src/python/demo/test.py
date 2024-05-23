from flask import Flask, request, render_template, redirect
from codrone_edu.drone import *
import time

app = Flask(__name__)
# drone = Drone()
# drone.pair()

@app.route('/', methods=['GET', 'POST'])
def home():
    return render_template('./index.html')

@app.route('/air/', methods=['GET', 'POST'])
def air():
    return render_template('takeoff.html')

@app.route('/takeoff/', methods=['GET', 'POST'])
def takeoff():
    print('takeoff')
    # drone.takeoff()
    time.sleep(1)
    return redirect('/air/')

@app.route('/land/', methods=['GET', 'POST'])
def land():
    print('land')
    # drone.land()
    # drone.close()
    time.sleep(1)
    return redirect('/')

@app.route('/forward/', methods=['GET', 'POST'])
def forward():
    print('forward')
    # drone.sendControlWhile(0, 100, 0, 0, 500)
    time.sleep(1)
    return redirect('/air/')

@app.route('/backward/', methods=['GET', 'POST'])
def backward():
    print('backward')
    # drone.sendControlWhile(0, -100, 0, 0, 500)
    time.sleep(1)
    return redirect('/air/')

@app.route('/left/', methods=['GET', 'POST'])
def left():
    print('left')
    # drone.sendControlWhile(-100, 0, 0, 0, 500)
    time.sleep(1)
    return redirect('/air/')

@app.route('/right/', methods=['GET', 'POST'])
def right():
    print('right')
    # drone.sendControlWhile(100, 0, 0, 0, 500)
    time.sleep(1)
    return redirect('/air/')


if __name__ == '__main__':
    app.run(debug=True)
