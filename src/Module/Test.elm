module Module.Test exposing (..)

import Browser
import Debug
import Html exposing (..)
import Html.Events exposing (..)
import Module.UILib exposing (primaryButton)


main =
    Browser.sandbox { init = init, update = update, view = view }



-- model


type alias Model =
    {}


init : Model
init =
    {}


type Msg
    = Demo



-- update


update : Msg -> Model -> Model
update msg model =
    case msg of
        Demo ->
            model
                |> Debug.log "[INFO]"



-- view


view : Model -> Html Msg
view model =
    div []
        [ primaryButton "Click Me" Demo ]
