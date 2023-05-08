module Types.Alias exposing (..)

import Bitwise exposing (and)
import Browser
import Debug
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)



-- main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- model


type alias Model =
    { user : User
    , text : String
    }


type alias User =
    { username : String
    , password : String
    }


init : Model
init =
    { user = { username = "", password = "" }
    , text = ""
    }



-- update


type Msg
    = Verify
    | UpdateUsername String
    | UpdatePassword String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Verify ->
            { model
                | text =
                    if verify model.user then
                        "ok"

                    else
                        "error"
            }

        UpdateUsername newUsername ->
            -- updateUser (updateUsername newUsername model.user) model
            {model | user={username=newUsername, password=model.user.password}}

        UpdatePassword newPassword ->
            -- updateUser (updatePassword newPassword model.user) model
            {model | user={username=model.user.username, password=newPassword}}


verify : User -> Bool
verify user =
    user.username == "openhe" && user.password == "123"


updateUser : User -> Model -> Model
updateUser newUser model =
    { model | user =  newUser }


updateUsername : String -> User -> User
updateUsername newUsername user =
    { user | username = newUsername }

updatePassword : String -> User -> User
updatePassword newPassword user =
    { user | username = newPassword }



-- view


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "text", placeholder "username", value model.user.username, onInput UpdateUsername ] []
        , input [ type_ "password", placeholder "password", value model.user.password, onInput UpdatePassword ] []
        , button [ onClick Verify ] [ text "login" ]
        , div [] [ text model.text ]
        ]
