boomBang :: [Int] -> [String]
boomBang xs = [ if x > 10 then "Boom!" else "Bang!" | x <- xs, odd x]
