cylinder :: Double -> Double -> Double
{-
cylinder r h = let square x = x * x
                   base = pi * square r
               in h * base
-}
cylinder r h = h * base
    where square x = x * x
          base = pi * square r

main :: IO ()
main = print (cylinder 2.0 5.0)
