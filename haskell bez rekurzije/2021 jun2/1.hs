
data Poklapanje = MkPoklapanje {
                                    kar :: Char,
                                    poz :: Int
                               } deriving Show


poklapanjeShow :: Poklapanje -> String
poklapanjeShow p = [kar p] ++ " (" ++ (show (poz p)) ++ ")"

poklapanjeM :: Int -> String -> Maybe Poklapanje
poklapanjeM i str
    | (length str) > i =  Just (MkPoklapanje (str !! i) i)
    | otherwise = Nothing

poklapanjeE :: Int -> String -> Either String Poklapanje
poklapanjeE i str
    | i < length str = Right $ MkPoklapanje (str !! i) i
    | otherwise = Left "Index error"

pronadjiM :: Poklapanje -> String -> Maybe Bool
pronadjiM k str
    | poz k < length str = Just $ kar k == str !! (poz k)
    | otherwise = Nothing

pronadjiE :: Poklapanje -> String -> Either String Bool
pronadjiE k str
    | poz k > length str = Left "Index error"
    | otherwise = Right $ kar k == str !! (poz k)