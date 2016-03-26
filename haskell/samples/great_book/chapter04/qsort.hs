qsort :: (Ord a) => [a] -> [a]
qsort [] = []
{-
qsort (x:xs) = (qsort [l | l <- xs, l < x]) ++ [x] ++ (qsort [r | r <- xs, r >= x])
-}
qsort (x:xs) =
    let smaller = [a | a <- xs, a <= x]
        larger = [a | a <- xs, a > x]
    in qsort smaller ++ [x] ++ qsort larger
