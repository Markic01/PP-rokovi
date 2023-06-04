
-- data lista i string racuna, ako ne postoji sa istim racunom, ubaci na pocetak sa iznosom nula
otvori :: [(String, Int)] -> String -> [(String, Int)]

otvori b br
    | elem br [x | x<- (map (fst) b)] = b
    | otherwise = (br,0):b

zatvori :: [(String, Int)] -> String -> [(String, Int)]
zatvori [] _ = []
zatvori (x:xs) br
    | fst x == br = xs
    | otherwise = x:(zatvori xs br)

uplati :: [(String, Int)] -> String -> Int -> [(String, Int)]
uplati [] _ _ = []
uplati (x:xs) br iznos
    | fst x == br = (fst x, (snd x) + iznos):xs
    | otherwise = x: uplati xs br iznos