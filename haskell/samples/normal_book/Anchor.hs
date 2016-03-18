data anchor = Anchor { aUrl :: String,
                aLabel :: String }

href (A aUrl = u) = u
