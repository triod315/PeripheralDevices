# Python code to
# demonstrate readlines()

 
# Using readlines()
file1 = open('HOLMS.INC', 'r')
Lines = file1.readlines()
 
count = 0
# Strips the newline character
for line in Lines:
    count += 1
    s=line.replace('(','')
    s=s.replace(')','')
    x=s.split(',')
    
    if int(x[0])!=0:
        x[0]=str(880-int(x[0]))
        print(f'Sound Speaker, {int(x[1]) // 5}, {x[0]}')
    else:
        x[0]=str("0")
        print(f'Waitms {int(x[1])//5}')
    
    
    