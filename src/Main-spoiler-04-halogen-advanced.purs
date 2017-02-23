module Main where

import Control.Monad.Aff (runAff, Aff())
import Control.Monad.Aff.Class (MonadAff)
import Control.Monad.Aff.Console (log)
import Control.Monad.Eff.Console (CONSOLE())
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Exception (throwException)
import Data.Array
import Data.Maybe
import Data.Tuple
import Halogen ( Component(), ComponentHTML(), ComponentDSL(), HalogenEffects(), Natural()
               , component, modify, runUI
               )
import Halogen.Query (liftAff')
import Halogen.Util (appendToBody, onLoad)
import Prelude
import Prim

import qualified Halogen.HTML.Events.Indexed as E
import qualified Halogen.HTML.Indexed as H
import qualified Halogen.HTML.Properties.Indexed as P


-- app state

data State = State (Array String) (Array Int) Int

initialState :: State
initialState = State [] [] 0

-- event handlers

data Button = Inc | Value Int | Plus

data Query a = Click Button a

type CalcEffects eff = HalogenEffects (console :: CONSOLE | eff)

-- from state to html

css :: forall p a. String -> P.IProp ("class" :: P.I | p) a
css = P.class_ <<< H.className

render :: State -> ComponentHTML Query
render (State log stack value) = H.div_
    [ H.div [css "value"] [H.text (show (Tuple stack value))]
    , H.input
        [ P.inputType P.InputSubmit
        , P.value "="
        , E.onClick (E.input_ (Click Inc))
        ]

    , valueButton 1
    , valueButton 2
    , valueButton 3
    , valueButton 4
    , valueButton 847

    , H.input
        [ P.inputType P.InputSubmit
        , P.value "+"
        , E.onClick (E.input_ (Click Plus))
        ]

    , H.div_ (map (\entry -> H.div_ [H.text entry]) log)

    ]

valueButton :: Int -> ComponentHTML Query
valueButton i = H.input
    [ P.inputType P.InputSubmit
    , P.value (show i)
    , E.onClick (E.input_ (Click (Value i)))
    ]


-- from events to state

type CalcAff eff = Aff (HalogenEffects (console :: CONSOLE | eff))
type CalcDSL eff = ComponentDSL State Query (CalcAff eff)

eval :: forall eff. Natural Query (CalcDSL eff)
eval (Click button next) = do
    liftAff' (log "click!")
    modify (\(State log arr i) -> case button of
        Inc      -> State log arr (i + 1)
        Value i' -> State log (i' : arr) i
        Plus     -> let newEntry = show arr ++ " -> " ++ show value
                        value = sum arr
                    in State (newEntry : log) [] value)
    return next

sum :: Array Int -> Int
sum [] = 0
sum arr = maybe 0 id i + maybe 0 sum is
  where
    i = head arr
    is = tail arr


-- throwing it all together

type CalcComponent eff = Component State Query (CalcAff eff)

ui :: forall eff. CalcComponent eff
ui = component render eval

main :: forall eff. Eff (CalcEffects eff) Unit
main = runAff throwException (const (pure unit)) appAsync
  where
    appAsync = do
        { node: node, driver: driver } <- runUI ui initialState
        onLoad (appendToBody node)
