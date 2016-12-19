data Context = Context Database TemplateReqository URLMapper

main :: IO ()
main = do ctx <- loadContext "./config"
          runCGI (appMain ctx)
    
