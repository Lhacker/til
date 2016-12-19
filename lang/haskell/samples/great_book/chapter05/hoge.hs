hoge = print $ head $ filter p [100000,99999..1]
    where p x = x `mod` 3829 == 0
