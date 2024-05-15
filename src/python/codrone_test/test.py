# Reference for the codrone: 
# https://docs.robolink.com/docs/codrone-edu/python/reference/library/

from codrone_edu.drone import *
import os, sys

def get_parameter(input_str, cmd) -> int: 
    input_str = input_str.replace(cmd, '').replace('\n', '')
    
    try:
        param_int = (int)(input_str.split(' ')[1])
    except:
        return -1
    
    return param_int
    

drone = Drone()
drone.pair()

drone.takeoff()

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
    
    elif command == 'status':
        for i in range(len(status)):
            print(f'{i} {status[i]}')
    
    else:
        print('Not a valid command! Please input again!')
