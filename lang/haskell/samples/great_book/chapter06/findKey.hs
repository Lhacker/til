findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
{-
findKey key [] = Nothing
findKey key ((k,v):xs)
  | key == k  = Just v
  | otherwise = findKey key xs
-}
findKey key xs = foldr
                  (\(k, v) acc -> if key == k then Just v else acc)
                  Nothing xs

phoneBook =
  [("betty", "555-2938")
  ,("bonnie", "452-2928")
  ,("patsy", "493-2928")
  ,("lucille", "205-2928")
  ,("wendy", "939-8282")
  ,("penny", "853-2492")
  ]
