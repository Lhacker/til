main = interact respondPalindrome

respondPalindrome :: String -> String
respondPalindrome =
    unlines .
    map (\xs -> if isPal xs then "Palindrome" else "not a Palindrome") .
    lines

isPal :: String -> Bool
isPal xs = xs == reverse xs
