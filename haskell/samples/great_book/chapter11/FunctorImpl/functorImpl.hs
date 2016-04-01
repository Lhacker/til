class Functor f where
    fmap :: (a -> b) -> f a -> f b

instance Functor [] where
    fmap = map

instance Functor (Either a) where
    fmap _ (Left a) = Left a
    fmap f (Right b) = Right (f b)

instance Functor IO where
    fmap f action = do
        x <- action
        return (f x)

instance Functor ((->) r) where
    fmap f g = (\x -> f (g x))

instance Functor Maybe where
    fmap _ Nothing = Nothing
    fmap f (Just x) = Just (f x)
