module PathUtils
  (concatPath) where

pathSep = '/'

concatPath :: [String] -> String
concatPath [] = error "concatPath []"
concatPath xs = foldl1 joinPath xs

joinPath :: String -> String -> String
joinPath a b
  | null a            = pathSep : b
  | last a == pathSep = a ++ b
  | otherwise         = a ++ [pathSep] ++ b
