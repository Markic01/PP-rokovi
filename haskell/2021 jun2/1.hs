import Data.Char

najduza :: [String] -> String
najduza [a] = a
najduza (x:xs)
    | length (najduza xs) > length x = najduza xs
    | otherwise = x

umanji :: String -> String
umanji [] = []
umanji (x:xs)
    | isUpper x = (toLower x):(umanji xs)
    | otherwise = x:(umanji xs)

razdvoj :: Char -> String -> [String]
razdvoj sep str
    | null str = []
    | otherwise = [uzmi] ++ razdvoj sep (drop (length uzmi + 1) str)
    where uzmi = takeWhile (/= sep) str

spoj :: String -> [String] -> String
spoj _ [a] = a
spoj sep (x:xs) = x ++ sep ++ (spoj sep xs)

words1 sep s =  case dropWhile (==sep) s of
                      "" -> []
                      s' -> w : words1 sep s''
                            where (w, s'') = break (==sep) s'

razdvoj1 sep str = words [if c == sep then ' ' else c|c<- str]
