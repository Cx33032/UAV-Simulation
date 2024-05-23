from flask import Flask, request, render_template, redirect
from codrone_edu.drone import *
import time

app = Flask(__name__)
# drone = Drone()
# drone.pair()

@app.route('/', methods=['GET', 'POST'])
def home():
    return render_template('./index.html')

@app.route('/takeoff/', methods=['GET', 'POST'])
def takeoff():
    print('takeoff')
    # drone.takeoff()
    time.sleep(1)
    return redirect('/')

@app.route('/land/', method=['GET', 'POST'])
def land():
    print('land')
    # drone.land()
    # drone.close()
    exit(0)



if __name__ == '__main__':
    app.run(debug=True)