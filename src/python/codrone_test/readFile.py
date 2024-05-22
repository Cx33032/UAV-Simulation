'''
file = open(r"src\python\codrone_test\testFile.txt", "r")
fileContent = file.readlines() #reads the contents of the file, every line
lineCount = len(fileContent) #how many lines are in the file

for i in range(lineCount):
    line = fileContent[i] 
    index = line.find(":") #finds the index of :
    if (index != -1):
        if i%2 == 0: 
            print("Direction is: " + line[index+2:], end="") #prints everything after : for direction
        else:
            print("Moves: " + line[index+2:], end="") #prints everything after : for how far it moves
    
file.close() #closes the file after reading 
'''

# file = open('src/python/codrone_test/testFile.txt')
# lines = file.readlines()

direction = []

direction.append('Forward')

print(direction)

# for line in lines:
#     if line.find('Direction') != -1:
#         print(f"The direction is {line.replace('Direction: ', '').replace('\n', '')}")
#     # else:
#     #     print(f"The distance is {line.replace("Move: ", '')}")

# file.close()