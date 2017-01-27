module Main where

import Control.Monad.Aff (runAff, Aff())
import Control.Monad.Aff.Class (MonadAff)
import Control.Monad.Aff.Console (log)
import Control.Monad.Eff.Console (CONSOLE())
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Exception (throwException)
import Halogen ( Component(), ComponentHTML(), ComponentDSL(), HalogenEffects(), Natural()
               , component, runUI, liftAff'
               )
import Halogen.Util (appendToBody, onLoad)
import Prelude
import Prim

import qualified Halogen.HTML.Events.Indexed as E
import qualified Halogen.HTML.Indexed as H
import qualified Halogen.HTML.Properties.Indexed as P


-- app state

data State = State

initialState :: State
initialState = State


-- event handlers

data Query a = Tick a


-- from state to html

render :: State -> ComponentHTML Query
render _ = H.div_
    [ H.div [] [H.text "hello universe!"]
    , H.input
        [ P.inputType P.InputSubmit
        , P.value "click me!"
        , E.onClick (E.input_ Tick)
        ]
    ]


-- from events to state

type CalcAff eff = Aff (HalogenEffects (console :: CONSOLE | eff))
type CalcDSL eff = ComponentDSL State Query (CalcAff eff)

eval :: forall eff. Natural Query (CalcDSL eff)
eval (Tick next) = do
    liftAff' (log "clicked!")
    return next


-- throwing it all together

type CalcComponent eff = Component State Query (CalcAff eff)

ui :: forall eff. CalcComponent eff
ui = component render eval

main :: forall eff. Eff (HalogenEffects (console :: CONSOLE | eff)) Unit
main = runAff throwException (const (pure unit)) appAsync
  where
    appAsync = do
        { node: node, driver: driver } <- runUI ui initialState
        onLoad (appendToBody node)
