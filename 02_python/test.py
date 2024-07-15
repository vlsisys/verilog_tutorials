import      os, sys, random
os.getcwd()

file_o_sum  = 'o_sum.vec'
file_o_c    = 'o_c.vec'
file_i_a    = 'i_a.vec'
file_i_b    = 'i_b.vec'
file_i_c    = 'i_c.vec'

fh_o_sum    = open(file_o_sum,  'w')
fh_o_c      = open(file_o_c,    'w')
fh_i_a      = open(file_i_a,    'w')
fh_i_b      = open(file_i_b,    'w')
fh_i_c      = open(file_i_c,    'w')

simNum      = 10
for n in range(simNum):
    intMIN, intMAX = 0, pow(2,32)-1
    intA    = random.randint(intMIN, intMAX)
    intB    = random.randint(intMIN, intMAX)
    intC    = random.randint(intMIN, 1)
    intSUM  = intA + intB + intC

    binA    = bin(intA  ).replace('0b','').rjust(32, '0') 
    binB    = bin(intB  ).replace('0b','').rjust(32, '0')
    binC    = bin(intC  ).replace('0b','').rjust(1,  '0')
    binSUM  = bin(intSUM).replace('0b','').rjust(33, '0')
    print('--------------------------------------------------')
    print('Iteration: %s'%(n))
    print('--------------------------------------------------')
    print('A    : %33s'%(binA))
    print('B    : %33s'%(binB))
    print('C    : %33s'%(binC))
    print('SUM  : %33s'%(binSUM))
    print('--------------------------------------------------')
    fh_o_sum.write(binSUM[1:33] + '\n')
    fh_o_c.write(binSUM[0] + '\n')
    fh_i_a.write(binA + '\n')
    fh_i_b.write(binB + '\n')
    fh_i_c.write(binC + '\n')

fh_o_sum.close()
fh_o_c.close()
fh_i_a.close()
fh_i_b.close()
fh_i_c.close()
