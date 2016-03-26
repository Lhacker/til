elem' :: (Eq a) => a -> [a] -> Bool
_ `elem'` [] = False
e `elem'` (x:xs) = if e == x then True else e `elem'` xs
