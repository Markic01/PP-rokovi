data Znak = Herc | Karo | Pik | Tref

instance Show Znak where
    show Herc = "Herc"
    show Karo = "Karo"
    show Pik = "Pik"
    show Tref = "Tref"

instance Eq Znak where
    (==) Herc Herc = True
    (==) Karo Karo = True
    (==) Pik Pik = True
    (==) Tref Tref = True
    (==) x y = False


data Karta = MkKarta {
                                    vred :: Int,
                                    znak :: Znak
                                 } deriving (Show,Eq)

type Ruka = [Karta]
znakShow :: Znak -> String
znakShow z
    | z == Herc = []
    | otherwise = []

izlistaj :: Znak -> Ruka -> [Karta]
--izlistaj znak lst = filter (znak == fst) (lst)
izlistaj z lst = foldl (tmp z) [] lst

tmp z acc x
    | znak x == z = x:acc
    | otherwise = acc


dodaj :: Ruka -> Karta -> Ruka
dodaj ruka karta
        | elem karta ruka = ruka
        | otherwise = (takeWhile (g karta) ruka) 
            ++ [karta] 
            ++ (dropWhile (g karta) ruka)

g karta x = vred x < vred karta

f::Karta->Ruka->Karta->Ruka
f karta acc x
    | vred x < vred karta = acc ++ [x]
    | otherwise = acc ++ [karta] ++ [x]

najjaca :: Ruka -> Karta
najjaca ruka = foldl h (MkKarta (-1) Herc) ruka

h acc x
    | vred acc < vred x = x
    | otherwise = acc

-- jako ludo uradjeno