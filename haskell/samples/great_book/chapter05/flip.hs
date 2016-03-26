flip' :: (a -> b -> c) -> b -> a -> c
--flip' f = g
--    where g x y = f y x
flip' f x y = f y x
