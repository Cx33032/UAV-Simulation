import json
import os
now_dir = str(os.getcwd())

def draw():
    # src\python\demo\UAV_Movement_Software
    now_dir1 = now_dir + '\\src\\python\\demo\\UAV_Movement_Software'
    now_dir1 = now_dir1[0].lower() + now_dir1[1:]

    command = f'processing-java --sketch=\"{now_dir1}\" --run'
    os.system(command)

def move(drone):
    file = open(now_dir + '\\src\\python\\demo\\Movements\\movements.json')
    json_path = json.load(file)
    for i in range(len(json_path['path'])):
        drone.reset_move()
        direction = json_path['path'][i]['direction']
        duration = json_path['path'][i]['duration']
        if direction == "forward":
            print(f"Forward {duration}")
            drone.sendControlWhile(0, 100, 0, 0, duration)
        elif direction == "right":
            print(f"Right {duration}")
            drone.sendControlWhile(100, 0, 0, 0, duration)
        elif direction == "back":
            print(f"Back {duration}")
            drone.sendControlWhile(0, -100, 0, 0, duration)
        else:
            print(f"Left {duration}")
            drone.sendControlWhile(-100, 0, 0, 0, duration)

def move_test():
    file = open(now_dir + '\\src\\python\\demo\\Movements\\movements.json')
    json_path = json.load(file)
    for i in range(len(json_path['path'])):
        direction = json_path['path'][i]['direction']
        duration = json_path['path'][i]['duration']
        if direction == "forward":
            print(f"Forward {duration}")
        elif direction == "right":
            print(f"Right {duration}")
        elif direction == "back":
            print(f"Back {duration}")
        else:
            print(f"Left {duration}")