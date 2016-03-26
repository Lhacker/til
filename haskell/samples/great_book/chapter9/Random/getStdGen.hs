import System.Random

main = do
    gen <- getStdGen
    putStrLn $ take 20 $ randomRs ('a', 'z') gen
    newGen <- getStdGen -- same gen!!!
    putStrLn $ take 20 $ randomRs ('a', 'z') newGen
    newGen' <- newStdGen
    putStrLn $ take 20 $ randomRs ('a', 'z') newGen'
    newGen'' <- getStdGen
    putStrLn $ take 20 $ randomRs ('a', 'z') newGen''
