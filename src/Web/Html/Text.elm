module Web.Html.Text exposing (..)

import Browser
import Html exposing (Attribute, Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Web.Button exposing (Model, update)



-- main


main =
    Browser.sandbox { init = init, update = update, view = view }

-- model

type alias Model =
    { content : String }


init : Model
init =
    { content = ""
    }

-- update
type Msg=Change String
update msg model =
    case msg of
        Change newContent ->
            {model | content=newContent}


-- view
view: Model -> Html Msg
view model=
    div[]
        [
            input[placeholder "Text to reserve", value model.content, onInput Change][]
            , div [] [text (String.reverse model.content)]
        ]
     

