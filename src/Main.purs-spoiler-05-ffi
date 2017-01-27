module Main
where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console

resourceLink :: { content_type :: String
                , path :: String
                }
resourceLink = { content_type: "text/html;charset=utf8"
               , path: "index.html"
               }

foreign import greetInJs :: forall eff. String -> Eff eff Unit

foreign import loadResource :: forall eff.
    { content_type :: String, path :: String } ->
    Eff eff Unit

foreign import loadResourceAsync :: forall eff.
    { content_type :: String, path :: String } ->
    (Int -> Eff eff Unit) ->
    Eff eff Unit


main :: forall eff. Eff (console :: CONSOLE | eff) Unit
main = do
    greetInJs "you there"
    loadResource { content_type: "application/json", path: "api/index" }
    loadResourceAsync ({ content_type: "application/json", path: "api/index" })
        (\resource -> print resource)
