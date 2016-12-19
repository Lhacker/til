describeList :: [a] -> String
describeList xs = "This list is "
                  ++ case xs of [] -> "empty."
                                [x] -> "a singleton list."
                                xs -> "a longer list."

{-
describeList xs = "This list is " ++ what xs
    where what [] = "empty."
          what [x] = "a singleton list."
          what xs = "a longer list."
-}
