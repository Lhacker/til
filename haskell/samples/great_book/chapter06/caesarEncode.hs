import Data.Char

caesarEncode :: Int -> String -> String
caesarEncode offset msg = map (\c -> chr $ ord c + offset) msg 

caesarDecode :: Int -> String -> String
caesarDecode shift msg = caesarEncode (negate shift) msg 
