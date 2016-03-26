reverse' :: [a] -> [a]
--reverse' = foldl (\acc x -> x : acc) []
reverse' = foldl (flip (:)) []
