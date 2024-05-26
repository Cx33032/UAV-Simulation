import os
now_dir = str(os.getcwd())
now_dir1 = now_dir + '\\src\\processing\\UAV_Movement_Software'
now_dir1 = now_dir1[0].lower() + now_dir1[1:]

command = f'processing-java --sketch=\"{now_dir1}\" --run'
os.system(command)