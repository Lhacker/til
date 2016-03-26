bmiTell :: Double -> Double -> String
bmiTell weight height
  | bmi <= skinny = "You're underewight, you emo, you!"
  | bmi <= normal = "You're supposely normal.\
                  \ Pffft, I bet you're ugly!"
  | bmi <= fat = "You're fat! Lose some weight, fatty!"
  | otherwise                   = "You're whale, congratulations!"
  where bmi = weight / height ^ 2
        skinny = 18.0
        normal = 25.0
        fat = 30.0
