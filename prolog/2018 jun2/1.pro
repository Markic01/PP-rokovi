% p(ime,prezime,igra,gricka)

sadrzi(X,[X|_]).
sadrzi(X,[_|R]):- sadrzi(X,R).

prijatelji(X):-
    X = [
        p(marko,_,_,nacos),
        p(_,markovic,_,kokice),
        p(_,_,bilijar,pica),
        p(_,_,_,_)
    ],
    sadrzi(p(ivana,stefanovic,_,_),X),
    sadrzi(p(nemanja,_,minigolf,_),X),
    sadrzi(p(_,radosavljevic,_,_),X),
    sadrzi(p(milica,_,_,_),X),
    sadrzi(p(_,stefanovic,_,_),X),
    sadrzi(p(_,_,stonifudbal,_),X),
    sadrzi(p(_,_,_,sladoled),X),
    sadrzi(p(_,milic,_,_),X),
    sadrzi(p(_,_,kuglanje,_),X),
    not(sadrzi(p(marko,_,stonifudbal,_,_),X)),
    not(sadrzi(p(milica,milic,_,_),X)),
    not(sadrzi(p(milica,_,bilijar,_),X)),
    not(sadrzi(p(nemanja,radosavljevic,_,_),X)),
    not(sadrzi(p(_,radosavljevic,kuglanje,_),X)).
