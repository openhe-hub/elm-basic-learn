module Module.UILib exposing (primaryButton)

import Html exposing (..)
import Html.Events exposing (..)


primaryButton : String -> msg -> Html msg
primaryButton label msg =
    button [ onClick msg ] [ text label ]
