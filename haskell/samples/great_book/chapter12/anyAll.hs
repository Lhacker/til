newtype Any = Any { getAny :: Bool }
    deriving (Show, Read, Eq, Ord, Bounded)

instance Monoid Any where
    mempty = Any False
    Any x `mappend` Any y = Any (x || y)

newtype All = All { getAll :: Bool }
    deriving (Show, Read, Eq, Ord, Bounded)

instance Monoid All where
    mempty = All True
    All x `mappend` All y = All (x && y)
