module Main
where

import Prelude                      (class Show, Unit, bind, show, (<<<), (<>))
import Control.Monad.Eff            (Eff)
import Control.Monad.Eff.Console    (CONSOLE, log)

newtype ResourceLink = ResourceLink
                { content_type :: String
                , path :: String
                }

instance showRLink :: Show ResourceLink where
    show (ResourceLink l) = "Resource " <> show l.path <> " of type " <> show l.content_type


resourceLink :: ResourceLink
resourceLink = ResourceLink
               { content_type: "text/html;charset=utf8"
               , path: "index.html"
               }


foreign import greetInJs :: forall eff. String -> Eff eff Unit

foreign import loadResource :: forall eff.
    ResourceLink ->
    Eff eff Unit

foreign import loadResourceAsync :: forall eff.
    ResourceLink ->
    (Int -> Eff eff Unit) ->
    Eff eff Unit


print :: forall eff a. (Show a) => a -> Eff ( console :: CONSOLE | eff ) Unit
print = log <<< show

main :: forall eff. Eff (console :: CONSOLE | eff) Unit
main = do
    greetInJs "you there"
    loadResource resourceLink
    print resourceLink
    loadResourceAsync (ResourceLink { content_type: "application/json", path: "api/ultimateanswer" })
        (\resource -> print resource)
