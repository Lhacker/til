import Data.Char

splitBy :: (a -> Bool) -> [a] -> [[a]]
splitBy p [] = []
splitBy p xs = a : (splitBy p $ dropWhile p $ b)
  where
    (a, b) = break p xs

splitBySpace :: String -> [String]
splitBySpace = splitBy isSpace

splitByComma :: String -> [String]
splitByComma = splitBy (\x -> x == ',')
