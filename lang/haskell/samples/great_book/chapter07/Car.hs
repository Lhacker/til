module Car
( Car
) where

data Car = Car { company :: String
               , model :: String
               , year :: Int
               } deriving (Show)

