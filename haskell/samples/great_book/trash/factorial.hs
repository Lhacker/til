factorial :: Integer -> Integer
factorial 0 = 1
factorial x = x * factorial (x - 1)

main :: IO ()
main = print (factorial 5)
