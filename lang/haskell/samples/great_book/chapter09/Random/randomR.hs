import System.Random

main = do
    print $ (randomR (1, 6) (mkStdGen 359353) :: (Int, StdGen))
    print $ (randomR (1, 6) (mkStdGen 35935335) :: (Int, StdGen))
    print $ take 10 $ randomRs ('a', 'z') (mkStdGen 3)
