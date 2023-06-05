% benzin 2$ po galonu
% dizel 1$ po galonu
% najvise 600k galona goriva
% bar dva galona dizela za svaki galon benzina
% bar 150k galona benzina
% ne vise od 325k galona dizela
% treba maksimizovati dnevnu zaradu

rafinerija(Vars) :- Vars = [Dizel, Benzin],
        Dizel :: 0..325000,
        Benzin :: 150000..600000,
        Dizel #>= 2*Benzin,
        Dizel + Benzin #=< 600000,
        labeling([maximize(2*Benzin+Dizel)],Vars),
        Zarada is 2*Benzin + Dizel,
        write('Maksimalna zarada je: '),write(Zarada),write(' dolara'),nl,
        write('Kolicina benzina: '),write(Benzin),write(' galona'),nl,
        write('Kolicina dizela: '),write(Dizel),write(' galona'),nl.
