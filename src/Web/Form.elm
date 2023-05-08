module Web.Form exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Bitwise exposing (and)



-- main
main =
    Browser.sandbox {init=init, update=update,view=view}

-- model


type alias Model =
    { name : String
    , password : String
    }


init : Model
init =
    Model "" ""

-- update
type Msg = OnNameChange String |  OnPasswordChange String 


update : Msg -> Model -> Model
update msg model =
    case msg of
        OnNameChange name->
            {model | name=name}

        OnPasswordChange password->
            {model | password=password}


-- view
view : Model -> Html Msg
view model =
    div[]
    [
        viewInput "text" "input name" model.name OnNameChange
        , viewInput "password" "input password" model.password OnPasswordChange
        , viewValidation model
    ]

viewInput: String->String->String->(String->msg) -> Html msg
viewInput type__ placeholder_ value_ toMsg =
    input [type_ type__, placeholder placeholder_, value value_, onInput toMsg] []

viewValidation: Model -> Html msg
viewValidation model=
    if model.password=="aaa" then
        div [style "color" "green"] [text "OK"]
    else 
        div [style "color" "red"] [text "ERROR"]

