main = do
    contents <- getContents
    putStrLn $ shortLineOnly contents

shortLineOnly :: String -> String
shortLineOnly = unlines . filter (\l -> length l < 10) . lines
