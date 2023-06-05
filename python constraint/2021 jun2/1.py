import constraint

def suma(b,c,d,m,s,x):
    return b+c+d+m+s+x == 7

def cena(b,c,d,m,s,x):
    return b*130+c*800+d*150+m*370+s*490+x*150 <= 100*118

def protein(b,c,d,m,s,x):
    return b*15+c*11+d*10+m*22+s*1+x*13 <= 100

def amino(b,c,d,m,s,x):
    return b*33+c*31+d*20+m*18+s*21+x*16 <= 200

def hemo(b,c,d,m,s,x):
    return b*92.5+c*155.5+d*79.6+m*156.2+s*413+x*137.7

p = constraint.Problem()

p.addVariable('B',range(0,10))
p.addVariable('C',range(0,20))
p.addVariable('D',range(0,7))
p.addVariable('M',range(0,5))
p.addVariable('S',range(0,3))
p.addVariable('X',range(0,9))

p.addConstraint(suma,'BCDMSX')
p.addConstraint(cena,'BCDMSX')
p.addConstraint(protein,'BCDMSX')
p.addConstraint(amino,'BCDMSX')

obj_max = {}
max_hemo = 0
for i in p.getSolutions():
    tr = hemo(i['B'],i['C'],i['D'],i['M'],i['S'],i['X'])
    if tr > max_hemo:
        max_hemo = tr
        obj_max = i

print(round(hemo(obj_max['B'],obj_max['C']
           ,obj_max['D'],obj_max['M'],
           obj_max['S'],i['X']),2))