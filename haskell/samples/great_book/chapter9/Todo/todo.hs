import System.Environment
import System.Directory
import Control.Exception
import System.IO
import Data.List

dispatch :: String -> [String] -> IO ()
dispatch "add" = add
dispatch "view" = view
dispatch "remove" = remove
dispatch "bump" = bump
dispatch command = commandDoesntExist

commandDoesntExist :: String -> [String] -> IO ()
commandDoesntExist command _ =
    putStrLn $ "The " ++ command ++ " command doesn't exist"

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")

view :: [String] -> IO ()
view [fileName] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith (\num task -> show num ++ " - " ++ task)
                        [0..] todoTasks
    putStr $ unlines numberedTasks

remove :: [String] -> IO ()
remove [fileName, numberString] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith (\num task -> show num ++ " - " ++ task)
                        [0..] todoTasks
    putStrLn "These are your TO-DO items:"
    mapM putStrLn numberedTasks
    let number = read numberString
        newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
    bracketOnError (openTempFile "." "temp")
        (\(tempName, tempHandle) -> do
            hClose tempHandle
            removeFile tempName)

        (\(tempName, tempHandle) -> do
            hPutStr tempHandle newTodoItems
            hClose tempHandle
            removeFile fileName
            renameFile tempName fileName)

bump :: [String] -> IO ()
bump [fileName, numberString] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        number = read numberString
        newTodoItems =  unlines $ [todoTasks !! number] ++ (delete (todoTasks !! number) todoTasks)
    putStrLn "These are new TO-DO items:"
    putStrLn newTodoItems
    bracketOnError (openTempFile "." "temp")
        (\(tempName, tempHandle) -> do
            hClose tempHandle
            removeFile tempName)

        (\(tempName, tempHandle) -> do
            hPutStr tempHandle newTodoItems
            hClose tempHandle
            removeFile fileName
            renameFile tempName fileName)

main = do
    (command:argList) <- getArgs
    dispatch command argList
