{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Main (
  main
) where

import Yesod

data App = App
instance Yesod App

mkYesod "App" [parseRoutes| / HomeR GET |]

getHomeR :: Handler Html
getHomeR = defaultLayout [whamlet| <h1>What, is this really a thing? |]

main = warp 80 App


