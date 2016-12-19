data Stack a = Empty | Push a (Stack a)

isEmpty :: Stack a -> Bool
isEmpty Empty = True
isEmpty (Push _ _) = False

top :: Stack a -> a
top (Push value _) = value
top Empty = error "no top."

pop :: Stack a -> Stack a
pop (Push _ stack) = stack
pop Empty = error "no top."
