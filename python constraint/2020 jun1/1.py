import constraint

def suma(b,p,j,m,v,n):
    return b+p+j+m+v+n<=10

def cena(b,p,j,m,v,n):
    return b*30+p*300+j*50+m*170+v*400+n*450 < 11700

def protein(b,p,j,m,v,n):
    return b*20+p*15+j*70+m*40+v*23+n*7

def masti(b,p,j,m,v,n):
    return b*30+p*300+j*50+m*170+v*400+n*450 < 500

def secer(b,p,j,m,v,n):
    return b*5+p*30+j*2+m*15+v*45+n*68 <= 150

p = constraint.Problem()

p.addVariable('b',range(0,11))
p.addVariable('p',range(0,21))
p.addVariable('j',range(0,8))
p.addVariable('m',range(0,6))
p.addVariable('v',range(0,4))
p.addVariable('n',range(0,10))

p.addConstraint(cena,'bpjmvn')
p.addConstraint(masti,'bpjmvn')
p.addConstraint(secer,'bpjmvn')
p.addConstraint(suma,'bpjmvn')

max = 0
obj = {}

for sol in p.getSolutions():
    tmp = protein(sol['b'],sol['p'],sol['j'],sol['m'],sol['v'],sol['n'])
    if tmp > max:
        max = tmp
        obj = sol

print(protein(obj['b'],obj['p'],obj['j'],obj['m'],obj['v'],obj['n']))