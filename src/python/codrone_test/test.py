# Reference for the codrone: 
# https://docs.robolink.com/docs/codrone-edu/python/reference/library/

from codrone_edu.drone import *
import os, sys

drone = Drone()
drone.pair()

drone.takeoff()
while True:
    drone.reset_move()
    status = drone.get_sensor_data()
    command = input('Enter Your Command: ')
    if command == 'land':
        drone.land()
        drone.close()
        break
    elif command == 'flip':
        drone.flip()
    elif command == 'forward':
        drone.move_forward(distance=50, units="cm", speed=1)
    elif command == 'back':
        drone.move_backward(distance=50, units="cm", speed=1)
    elif command == 'right':
        drone.move_right(distance=50, units="cm", speed=1)
    elif command == 'left':
        drone.move_left(distance=50, units="cm", speed=1)
    elif command == 'status':
        for i in range(len(status)):
            print(f'{i} {status[i]}')
    
    else:
        print('Not a valid command! Please input again!')
