data WikiRequest = ViewRequest { name :: String }
                 | EditRequest { name :: String }
                 | SaveRequest { name :: String, content :: String }
                 | RecentRequest 

appMain :: Context -> HTTPRequest -> IO HTTPResponse
appMain ctx = wikiSession ctx . wikiRequest

wikiRequest :: HTTPRequest -> WikiRequest
wikiRequest req =
    case (lookupVar "cmd" req, lookupVar "name" req) of
        (Nothing,       Just name) -> ViewRequest name
        (Just "view",   Just name) -> ViewRequest name
        (Just "edit",   Just name) -> EditRequest name
        (Just "save", Just name)   -> case lookupVar "text" req of
                                        Just cs -> SaveRequest name cs
                                        Nothing -> ViewRequest frontPageName
        (Just "recent", _)         -> RecentRequest
        _ -> ViewRequest frontPageName

wikiSession :: Context -> wikiRequest -> IO HTTPResponse
wikiSession (Context db tmpl umap) req =
    catch (respondTo req) (\err -> frontPageResponse)
  where
    respondTo (ViewRequest name) =
      catch (viewPageResponse name) (\err -> editPageResponse name)

    respondTo (EditRequest name) = editPageResponse name

    respondTo (SaveRequest name content) =
      do savePageSource db name content
        return $ softRedirectResponse (pageURL umap name)

    respondTo (RecentRequest) = recentResponse
