file = open("src/python/codrone_test/testFile.txt")
fileContent = file.readlines() #reads the contents of the file, every line

directions = []
distances = []

for line in fileContent:
    if line.find("Direction: ") != -1:
        directions.append(line[11:].strip())
    else:
        distances.append(line[6:].strip())

for i in range(len(directions)):
    print(directions[i] + ": " + distances[i])

file.close() #closes the file after reading 

'''
file = open('src/python/codrone_test/testFile.txt')
lines = file.readlines()

for line in lines:
    if line.find('Direction') != -1:
        print(f'The direction is {line.replace('Direction: ', '')}', end = '. ')
    else:
        print(f'The distance is {line.replace('Move: ', '')}')

file.close()
'''