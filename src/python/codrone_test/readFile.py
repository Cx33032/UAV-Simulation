from codrone_edu.drone import *
import os, sys, time

file = open("src/python/codrone_test/testFile.txt")
fileContent = file.readlines() #reads the contents of the file, every line

directions = []
durations = []

for line in fileContent:
    if line.find("Direction: ") != -1:
        directions.append(line[11:].strip())
    else:
        durations.append(line[6:].strip())

file.close() #closes the file after reading 

drone = Drone()
drone.pair()

drone.takeoff()
time.sleep(3)
for i in range(len(directions)):
    if directions[i] == "Forward":
        drone.sendControlWhile(0, 100, 0, 0, durations[i])
    elif directions[i] == "Right":
        drone.sendControlWhile(100, 0, 0, 0, durations[i])
    elif directions[i] == "Down":
        drone.sendControlWhile(0, -100, 0, 0, durations[i])
    else:
        drone.sendControlWhile(-100, 0, 0, 0, durations[i])

drone.land()
drone.close()

'''
file = open('src/python/codrone_test/testFile.txt')
lines = file.readlines()

# file = open('src/python/codrone_test/testFile.txt')
# lines = file.readlines()

direction = []

file.close()
'''

direction.append('Forward')

print(direction)

# for line in lines:
#     if line.find('Direction') != -1:
#         print(f"The direction is {line.replace('Direction: ', '').replace('\n', '')}")
#     # else:
#     #     print(f"The distance is {line.replace("Move: ", '')}")

# file.close()
