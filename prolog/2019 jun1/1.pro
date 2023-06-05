% o(ime,prezime,vrsta,boja)

drugarice(X):-
    X=[
        o(_,ranisavljevic,_,zelene),
        o(_,_,cizme,braon),
        o(_,_,_,_),
        o(_,_,_,_)
    ],
    clan(o(milica,_,sandale,_),X),
    clan(o(jelena,_,_,_),X),
    clan(o(_,_,cizme,braon),X),
    clan(o(_,_,_,crne),X),
    clan(o(_,cugurovic,_,_),X),
    clan(o(anja,_,_,_),X),
    clan(o(_,bogdanovic,_,_),X),
    clan(o(_,ranisavljevic,_,_),X),
    clan(o(kaca,andonov,_,_),X),
    clan(o(_,_,cipele,_),X),
    clan(o(_,_,_,pink),X),
    clan(o(_,_,patike,_),X),
    not(clan(o(_,cugurovic,cizme,braon),X)),
    not(clan(o(_,_,sandale,crne),X)),
    not(clan(o(kaca,andonov,cizme,_),X)),
    not(clan(o(_,_,cipele,pink),X)),
    not(clan(o(anja,bogdanovic,_,_),X)),
    not(clan(o(jelena,_,patike,_),X)).

clan(X,[X|_]).
clan(X,[_|R]):-clan(X,R).

