myCompare :: (Ord a) => a -> a -> Ordering
myCompare a b
  | a == b = EQ
  | a <= b = LT
  | otherwise = GT
