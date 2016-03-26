import Control.Monad
import Data.Char

main = forever $ do
    putStr "Give me your input: "
    l <- getLine
    putStrLn $ map toUpper l
