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
            execute model 
            -- |> execute2


execute : Model -> Model
execute model =
    let
        newModel =
            model

        tmp =
            Debug.log "Hello world" ()
    in
    newModel

-- execute2 : Model -> Model
-- execute2 model =
--     let
--         newModel =
--             model

--         tmp =
--             Debug.log "Hello world 2" ()
--     in
--     newModel



-- view


view : Model -> Html Msg
view model =
    button [ onClick Demo ] [ text "run" ]
