dodaj :: [(Int, Char)] -> (Int, Char) -> [(Int, Char)]
dodaj [] karta = [karta]
dodaj (x:xs) karta
        | fst x == fst karta && snd x == snd karta = (x:xs)
        | fst x < fst karta = x:(dodaj xs karta)
        | fst x > fst karta = karta:(x:xs)
        | fst x == fst karta && snd x < snd karta = x:(dodaj xs karta)
        | fst x == fst karta && snd x > snd karta = karta:(x:xs)

ukloni :: [(Int, Char)] -> (Int, Char) -> [(Int, Char)]
ukloni [] _ = []
ukloni (x:xs) karta
        | x == karta = xs
        | otherwise = x : (ukloni xs karta)

uporedi [] [] = EQ
uporedi (x:xs) (y:ys)
        | (fst x) < (fst y) = LT
        | (fst x) > (fst y) = GT
        | otherwise = uporedi xs ys