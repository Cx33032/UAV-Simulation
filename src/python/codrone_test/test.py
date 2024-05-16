# Reference for the codrone: 
# https://docs.robolink.com/docs/codrone-edu/python/reference/library/

from codrone_edu.drone import *
import os, sys, time
now_dir = os.getcwd()
sys.path.append(now_dir) # Add the working directory to the path
import atexit

drone = Drone()
drone.pair()

drone.takeoff()

def get_parameter(input_str, cmd) -> int: 
    input_str = input_str.replace(cmd, '').replace('\n', '')
    
    try:
        param_int = (int)(input_str.split(' ')[1])
    except:
        return -1
    
    return param_int

@atexit.register
def land_drone():
    drone.land()
    drone.close()

# The move method is controlled by send_absolute_value which I think it will only move based on the initial value
'''
def spiral_pattern():
    for i in range(1, 4):
        time_sleep = (50 * i / 100.0 + 1 if (50 * i / 100.0 + 1) > 2 else 2) + 1
        if i % 2 == 0:
            print(f'{i} if, time: {time_sleep}')
            print(f'move backward {50 * i}')
            drone.move_backward(distance=50 * i, units="cm", speed=1)
            time.sleep(time_sleep)
            print(f'move left {50 * i}')
            drone.move_left(distance=50 * i, units="cm", speed=1)
            time.sleep(time_sleep)
        else:
            print(f'{i} else, time: {time_sleep}')
            print(f'move forward {50 * i}')
            drone.move_forward(distance=50 * i, units="cm", speed=1)
            time.sleep(time_sleep)
            print(f'move right {50 * i}')
            drone.move_right(distance=50 * i, units="cm", speed=1)
            time.sleep(time_sleep)
        time.sleep(1)
'''

def spiral_pattern():
    for i in range(1, 4):
        if i % 2 == 0:
            drone.sendControlWhile(0, -50, 0, 0, i)
            drone.sendControlWhile(-50, 0, 0, 0, i)
        else:
            drone.sendControlWhile(0, 50, 0, 0, i)
            drone.sendControlWhile(50, 0, 0, 0, i)

drone.set_throttle(50)
drone.move(0.5)

while True:
    drone.reset_move()
    status = drone.get_sensor_data()
    angle_now = int(drone.get_z_angle())
    print(f'Battery left: {drone.get_battery()}%')
    print(f'Facing angle: {angle_now} degrees')
    print(drone.get_flight_state())
    # time.sleep(1)
    
    command = input('Enter Your Command: ')
    if command == 'land':
        drone.land()
        drone.close()
        break
    
    elif command == 'flip':
        drone.flip()
        time.sleep(1)
        
    elif command == 'triangle':
        drone.triangle()
        time.sleep(1)

    elif command == 'circle':
        drone.circle()
        time.sleep(1)

    elif command == 'square':
        drone.square()
        time.sleep(1)
        
    elif command.find('forward') != -1:
        temp_dis = get_parameter(command, 'forward')
        distance = (temp_dis if temp_dis > 0 and temp_dis < 100 else 50)
        drone.move_forward(distance=distance, units="cm", speed=1)
        time.sleep(2)
        
    elif command.find('back') != -1:
        temp_dis = get_parameter(command, 'back')
        distance = (temp_dis if temp_dis > 0 and temp_dis < 100 else 50)
        drone.move_backward(distance=distance, units="cm", speed=1)
        time.sleep(2)
        
    elif command.find('right') != -1:
        temp_dis = get_parameter(command, 'right')
        distance = (temp_dis if temp_dis > 0 and temp_dis < 100 else 50)
        drone.move_right(distance=distance, units="cm", speed=1)
        time.sleep(2)
        
    elif command.find('left') != -1:
        temp_dis = get_parameter(command, 'left')
        distance = (temp_dis if temp_dis > 0 and temp_dis < 100 else 50)
        drone.move_left(distance=distance, units="cm", speed=1)
        time.sleep(2)

    elif command.find('face') != -1:
        temp_dis = get_parameter(command, 'face')
        heading = (temp_dis if temp_dis >= 0 and temp_dis <= 360 else 0)
        drone.turn_degree(heading - angle_now)
        time.sleep(2)

    elif command == 'spiral':
        spiral_pattern()
        time.sleep(1)
    
    elif command == 'status':
        for i in range(len(status)):
            print(f'{i} {status[i]}')
    
    else:
        print('Not a valid command! Please input again!')
