main = interact shortLineOnly

shortLineOnly :: String -> String
shortLineOnly = unlines . filter (\l -> length l < 10) . lines
