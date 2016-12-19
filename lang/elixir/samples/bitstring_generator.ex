pixels = <<213, 45, 132, 64, 76, 32, 76, 0, 0, 234, 32, 15>>
IO.inspect for <<r::8, g::8, b::8 <- pixels>>, do: {r, g, b}
