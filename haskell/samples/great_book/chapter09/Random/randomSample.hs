import System.Random

main = do
    print $ (take 5 $ randoms (mkStdGen 11) :: [Int])
    print $ (take 5 $ randoms (mkStdGen 11) :: [Bool])
    print $ (take 5 $ randoms (mkStdGen 11) :: [Float])
