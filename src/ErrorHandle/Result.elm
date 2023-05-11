module ErrorHandle.Result exposing (..)

import Browser
import Debug
import Html exposing (..)
import Html.Events exposing (..)



-- main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- model


type alias Model =
    { ages : List String
    }


init : Model
init =
    { ages = [ "-1", "17", "19" ] }


isAlcoholOk : String -> Result String Int
isAlcoholOk input =
    case String.toInt input of
        Nothing ->
            Err "not a number."

        Just age ->
            if age < 0 then
                Err "age cannot be negative."

            else if age <= 18 then
                Err "you are too young."

            else
                Ok age



-- update


type Msg
    = Demo



-- type Result error value
--   = Ok value
--   | Err error


update : Msg -> Model -> Model
update msg model =
    case msg of
        Demo ->
            let
                newModel =
                    model

                tmp =
                    Debug.log "Hello world" (List.map isAlcoholOk model.ages)
            in
            newModel



-- view


view : Model -> Html Msg
view model =
    button [ onClick Demo ] [ text "run" ]
