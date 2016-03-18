import PathUtils

pagePath db name = concatPath [prefix db, "pages", encodeName name]

pageSource :: Database -> String -> IO String
pageSource db name = readFile (pagePath db name)


