#SedaNurTaskan - 201180004
import random
from tabulate import tabulate

numbers = [27,18,29,28,39,13,16,41,17,19]

keyNumber = len(numbers) #int(input("(give 810 for %90 packing) Enter a key number: "))
row = 11 #int((keyNumber/90)*100)#for make %90 packing factor
print(row)
# for x in range(keyNumber):
#     numbers.append(random.randint(0,400)) #genarete random keys

print("Keys: ", numbers)

# modN = int(input("Enter mod: "))
mod = lambda x : x % row # mod function

#REISCH {
print("REISCH")

def probe(key, table):
    probes = 0
    found = False
    probe = 0
    ind = mod(key)

    while found != True:
        probe = probe + 1

        if key == table[ind][0]:
            found = True
            probes = probe
        else:
            ind = table[ind][1]
    return probes

def searchR(key,table):
    step = 0
    found = False

    ind = mod(key)
    while found != True:
        step = step + 1

        if key == table[ind][0]:
            found = True
            print("Key Found! Key Location is:",ind,". Key found at ",step,"th step.")
        elif step == len(table):
            print("Table hasn't got this key.")
            found = True
        else:
            ind = table[ind][1]

table = [[-1]*2]*row # 2 dimensional list

empty = [[-1]*2]*row #2 dimensional list for empty rows
for x in range(row):
    empty[x] = [x,-1]

i = 0
emptyIndex = [-1]*row
for m in range(row):   #1 dimensional list for empty indexes
    emptyIndex[m] = m

for x in numbers:
    rem = mod(x) #calculating mods

    if table[rem] != [-1,-1] and table[rem] == [rem,-1]: # example: 7. | 23 | -
        loc = random.choice(emptyIndex)
        if empty[loc] == [loc,-1]:

            element = table[rem][0]

            table[loc] = [x,-1]             #location(homeaddress) is full and it has no link
            table[rem] = [element, loc]     #then find a random place from empty locations and fill with this number
                                            #and make the link of homeadress
            empty[loc]= [loc,1]
                                            #remove the location from empyt arrays because it is full
            emptyIndex.remove(loc)

    elif table[rem] != [-1,-1] and table[rem] != [rem,-1]: # example: 7. | 23 | 3
        loc = random.choice(emptyIndex)
        if empty[loc] == [loc,-1]:

            element = table[rem][0]         #location(homeaddress) is full and it has a link
            connect = table[rem][1]         #then find a random place from empty location and fill with this number
                                            #and take homeaddress elements link and change 
            table[loc] = [x,connect]        #make homeaddress' link new location
            table[rem] = [element, loc]     #now, new element's link is old link of homeaddress

            empty[loc]= [loc,1]
                                            #remove the location from empyt arrays because it is full
            emptyIndex.remove(loc)
    
    elif table[rem] == [-1,-1]: #example: 7. | - | - 
        table[rem] = [x,-1]                 #if cell is empty then fill the cell with number

        empty[rem] = [rem,1]
                                            #remove the location from empyt arrays because it is full
        emptyIndex.remove(rem)

    i=i+1

print(table)
packingFactor = len(numbers)/row*100       #calculating packing factor
print("Packing Factor: ~%",int(packingFactor))

headers = ["Index","Key", "Link","Probe"]

# my_table = [([-1] * 4) for r in range(row)]
# for y in range(row):
#     probes = probe(table[y][0],table)
#     my_table = ([y, table[y][0], table[y][1], probes]) #printing table

#print(tabulate(my_table, headers, tablefmt="simple_grid"))
key = int(input("Enter a key to search:"))
searchR(key,table)

#end of REISCH }
# print("#-------------------------------------#")
# #binary {
# print("binary")

# table_B = [[-1]*2]*row # 2 dimensional list

# empty_B = [[-1]*2]*row #2 dimensional list for empty rows
# for x in range(row):
#     empty_B[x] = [x,-1]

# i_B = 0
# emptyIndex_B = [-1]*row

# class Node:
#     def __init__(self,data, index):
#         self.left = None 
#         self.right = None 
#         self.data = data
#         self.index = index

# for y in range(len(numbers)):
#     root = Node(numbers[y],mod(numbers[y]))

#     root.index = mod(numbers[y])
#     root.data = numbers[y]

#     if table_B[root.index] == [-1,-1]:      #example: 7. | - | - 
#         table_B[root.index] = [numbers[y],-1]   

#     elif table_B[root.index] != [-1,-1]:    #example: 7. | 23 | - or 7. | 23 | 5
#         root.left = Node(table_B[root.index + int(numbers[y]/row)],root.index + int(numbers[y]/row))

#         if root.left.data == [-1,-1]:
#             table_B[root.left.index] = [root.data, -1] 

#         elif root.left.data != [-1,-1]:
#             root.right = Node(table_B[root.index + int(numbers[y]/row)], root.index + int(numbers[y]/row))

#             if root.right.data == [-1,-1]:
#                 table_B[root.right.index] = [root.data, -1] 

# packingFactorB = len(numbers)/row*100       #calculating packing factor
# print("Packing Factor: ~%",int(packingFactorB))

# headers = ["Index","Key", "Link"]

# my_tableB = [[0 for x in range(3)] for r in range(row)]
# for y in range(row):
#     my_tableB[y] = ([y, table_B[y][0], table_B[y][1]]) #printing table

# print(tabulate(my_tableB, headers, tablefmt="simple_grid"))
# #end of binary }