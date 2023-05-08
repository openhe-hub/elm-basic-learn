module Types.Pattern exposing (..)

import Browser
import Debug
import Html exposing (..)
import Html.Events exposing(..)

-- main


main =
    Browser.sandbox { init = init, update = update, view = view }

-- model


type alias Model =
    {
        user: User
    }

type User
  = Regular String Int
  | Visitor String

toName : User -> String
toName user =
  case user of
    Regular name age ->
      name++String.fromInt age

    Visitor name ->
      name


init : Model
init =
    {
        user=(Visitor "aaa")
    }

-- update


type Msg
    = Demo


update : Msg -> Model -> Model
update msg model =
    case msg of
        Demo ->
            execute model 

execute : Model -> Model
execute model =
    let
        newModel =
            model

        tmp =
            Debug.log (toName model.user) ()
    in
    newModel



-- view


view : Model -> Html Msg
view model =
    button [ onClick Demo ] [ text "run" ]
