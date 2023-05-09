module ErrorHandle.Maybe exposing (..)

import Browser
import Debug
import Html exposing (..)
import Html.Events exposing (..)
import List



-- main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- model


type alias Model =
    { users : List User
    }


init : Model
init =
    { users = [ { name = "aaa", age = Just 21 }, { name = "bbb", age = Nothing } ] }



-- update


type Msg
    = Demo



-- type Maybe a
--     = Just a
--     | Nothing


type alias User =
    { name : String
    , age : Maybe Int
    }


canBuyAlcohol : User -> Bool
canBuyAlcohol user =
    case user.age of
        Nothing ->
            False

        Just age ->
            age >= 18


update : Msg -> Model -> Model
update msg model =
    case msg of
        Demo ->
            let
                newModel =
                    model
                tmp =
                    Debug.log "" (List.map canBuyAlcohol model.users)
            in
            newModel

-- view


view : Model -> Html Msg
view model =
    button [ onClick Demo ] [ text "run" ]
