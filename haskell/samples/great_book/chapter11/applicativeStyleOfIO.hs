main = do
    a <- (++) <$> getLine <*> getLine
    putStrLn $ "The two lines concatenated turn out t be: " ++ a
