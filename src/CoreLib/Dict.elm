module CoreLib.Dict exposing (..)

import Browser
import Debug
import Dict exposing (Dict)
import Html exposing (..)
import Html.Events exposing (..)



-- main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- model


type alias Model =
    { users : Dict String User
    }


type alias User =
    { name : String
    , age : Int
    , height : Float
    }


init : Model
init =
    { users = Dict.fromList [ ( "aaa", User "aaa" 10 1.65 ), ( "bbb", User "bbb" 20 1.89 ) ]
    }



-- update


type Msg
    = Demo


update : Msg -> Model -> Model
update msg model =
    case msg of
        Demo ->
            insert model
                |> remove
                |> get "aaa"
                |> get "ddd"
                |> Debug.log "result"


insert : Model -> Model
insert model =
    { model | users = Dict.insert "ccc" (User "ccc" 30 1.8) model.users }


remove : Model -> Model
remove model =
    { model | users = Dict.remove "ccc" model.users }


get : String -> Model -> Model
get key model =
    case Dict.get key model.users of
        Just user ->
            model |> Debug.log "Found"
        Nothing ->
            model |> Debug.log "Key not exist"


view : Model -> Html Msg
view model =
    button [ onClick Demo ] [ text "run" ]
