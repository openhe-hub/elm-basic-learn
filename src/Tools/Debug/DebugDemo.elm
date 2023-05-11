module Tools.Debug.DebugDemo exposing (..)

import Browser
import Debug
import Html exposing (..)
import Html.Events exposing (..)



-- main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- model


type alias Model =
    {}


init : Model
init =
    {}



-- update


type Msg
    = Demo


update : Msg -> Model -> Model
update msg model =
    case msg of
        Demo ->
            let
                newModel =
                    model

                tmp =
                    Debug.log "Hello world" ()
            in
            newModel



-- view


view : Model -> Html Msg
view model =
    button [ onClick Demo ] [ text "run" ]
