newtype Pair b a = Pair { getPair :: (a, b) }

instance Functor (Pair c) where
    fmap f (Pair (x, y)) = Pair (f x, y)

-- type -> fmap :: (a -> b) -> Pair c a -> Pair c b
