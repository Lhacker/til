collatz :: Integer -> [Integer]
collatz 1 = [1]
collatz n
  | even n = n : collatz (n `div` 2)
  | odd n  = n : collatz (n * 3 + 1)

numLong :: Int
--numLong = length $ filter (\xs -> length xs >= 15) $ map collatz [1..100]
numLong = length $ filter isLong $ map collatz [1..100]
  where isLong xs = length xs >= 15
