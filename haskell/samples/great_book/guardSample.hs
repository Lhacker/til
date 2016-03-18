bmiTell :: Double -> String
bmiTell bmi
  | bmi <= 18.5 = "thin"
  | bmi <= 25.0 = "normal"
  | otherwise = "fat"
