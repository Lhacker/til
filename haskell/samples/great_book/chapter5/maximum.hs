maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 max
