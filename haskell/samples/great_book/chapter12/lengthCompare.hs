import Data.Monoid

lengthCompare :: String -> String -> Ordering
lengthCompare x y = let a = length x `compare` length y
                        b = x `compare` y
                    in if a == EQ then b else a

lengthCompare2 :: String -> String -> Ordering
lengthCompare2 x y = (length x `compare` length y) `mappend`
                     (x `compare` y)
