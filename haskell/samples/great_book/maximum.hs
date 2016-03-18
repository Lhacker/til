maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of emp l"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)
{-
main :: IO()
main = do putStrLn "start!"
          array <- getLine
          print $ maximum' $ (read array :: [Int])
-}
