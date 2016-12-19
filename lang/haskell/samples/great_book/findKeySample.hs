import qualified Data.Map as Map
-- comment out
{- comment out -}

-- test main

sampleList = [
              ("1", "hoge"),
              ("2", "fuga"),
              ("3", "foo"),
              ("4", "bar")
              ]

main = print $ Map.lookup (\ (k, v) -> k == "1") $ Map.fromList sampleList
