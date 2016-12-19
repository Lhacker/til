newtype Product a = Product { getProduct :: a }
    deriving (Show, Read, Eq, Ord, Bounded)

instance Num a => Monoid (Product a) where
    mempty = Product 1
    (Product x) `mappend` (Product y) = Product (x * y)

newtype Sum a = Sum { getSum :: a }
    deriving (Show, Read, Eq, Ord, Bounded)

instance Num a => Monoid (Sum a) where
    mempty = Sum 0
    (Sum x) `mappend` (Sum y) = Sum (x + y)
