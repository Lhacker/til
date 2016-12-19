viewPageResponse name =
  do body <- pageHTML db name
     html <- fill "view" name body
     return (HTTPResponse pageContentType html)
     
