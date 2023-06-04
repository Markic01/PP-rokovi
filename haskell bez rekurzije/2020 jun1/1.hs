


data Transakcija = MkTransakcija {
                                    ident :: Int,
                                    iznos :: Int,
                                    posiljalac :: String,
                                    primalac :: String
                                 } deriving (Show,Eq)

type AktivneTransakcije = [Transakcija]

izlistaj :: AktivneTransakcije -> String -> [Transakcija]
izlistaj ts br = filter (\t -> or [posiljalac t == br, primalac t == br]) ts

dodaj :: AktivneTransakcije -> Transakcija -> AktivneTransakcije
dodaj ts t = t:ts

ukloni :: AktivneTransakcije -> Int -> AktivneTransakcije
ukloni ts ident = filter (\(MkTransakcija i _ _ _) -> i /= ident) ts

ukupno :: AktivneTransakcije -> Int
ukupno ts = foldl (\acc (MkTransakcija _ i _ _) -> i+acc) 0 ts