import json
import sys

class Player:
    def __init__(self,ime,prezime,visina,godine,dres):
        self.ime=ime
        self.prezime=prezime
        self.visina=visina
        self.godine=godine
        self.dres=dres
        if self.visina >= 200:
            self.pozicija = 5
        elif self.visina < 190:
            self.pozicija = 1
        else:
            self.pozicija = 3

    def __str__(self):
        return self.ime + " "+self.prezime
    

f = open(sys.argv[1])

igraci = json.load(f)

niz = []
for igrac in igraci:
    niz.append(Player(igrac['ime'],igrac['prezime'],igrac['visina'],igrac['godine'],igrac['dres']))

for i in niz:
    print(i)

max_godina = int(input())
pozicija = int(input())

max_visina=-1

for igrac in niz:
    if pozicija == igrac.pozicija and max_godina >= igrac.godine:
        max_visina = max(max_visina, igrac.visina)

print(max_visina)
        