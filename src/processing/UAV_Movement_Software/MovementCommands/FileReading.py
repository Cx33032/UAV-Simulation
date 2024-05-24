from codrone_edu.drone import *
import os, sys, time

file = open("src/processing/UAV_Movement_Software/MovementCommands/movements.txt")
fileContent = file.readlines() #reads the contents of the file, every line

directions = []
durations = []

for line in fileContent:
    if line.find("Direction: ") != -1:
        directions.append(line[11:].strip())
    else:
        durations.append(line[6:].strip())

file.close() #closes the file after reading 

#drone = Drone()
#drone.pair()

#drone.takeoff()
time.sleep(3)
for i in range(len(directions)):
    if directions[i] == "Forward":
        print("Forward " + durations[i])
        #drone.sendControlWhile(0, 100, 0, 0, durations[i])
    elif directions[i] == "Right":
        print("Right " + durations[i])
        #drone.sendControlWhile(100, 0, 0, 0, durations[i])
    elif directions[i] == "Back":
        print("Back " + durations[i])
        #drone.sendControlWhile(0, -100, 0, 0, durations[i])
    else:
        print("Left " + durations[i])
        #drone.sendControlWhile(-100, 0, 0, 0, durations[i])

#drone.land()
#drone.close()