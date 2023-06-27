# pub(p,q) = (n,e)   n=p*q
# priv(p,q) = (k * phi(n) +1 ) / e

def gcd(x,y):
    for i in range(2,x+1):
        if y % i == 0 and x % i == 0:
            return False
    return True

def prime(x):
    for i in range(2,x):
        if x % i == 0:
            return False
    return True

def get_primes():
    i = 2
    while True:
        if prime(i):
            yield i
        i=i+1

def pub(p,q):
    phi = (p-1)*(q-1)
    n = p*q
    for i in range(2,phi):
        if gcd(i,phi):
            e=i
            break
    return (n,e)

def priv(p,q,k):
    (_,e) = pub(p,q)
    phi = (p-1)*(q-1)
    return float(k*phi + 1) / e

import sys
import json
filepath = sys.argv[1]
f = open(filepath).read()
x = json.loads(f)
i = 1
for elem in get_primes():
    if i == x['n']:
        nth = elem
    if i == x['m']:
        mth = elem
    if i > x['m'] and i > x['n']:
        break
    i=i+1

print(round(priv(nth,mth,x['k']),2))