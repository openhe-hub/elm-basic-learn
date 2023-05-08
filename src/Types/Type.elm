module Types.Type exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- model


type alias Model =
    { str : String
    , num : Float
    , num1 : Int
    }


init : Model
init =
    { str = "hello world"
    , num = 0.1
    , num1 = 10
    }



-- update


type Msg
    = Repeat
    | Half
    | Dist


update : Msg -> Model -> Model
update msg model =
    case msg of
        Repeat ->
            { model | str = String.repeat 3 model.str }

        Half ->
            { model | num = half model.num }

        Dist ->
            { model | num = dist model.num model.num1 }



-- half


half : Float -> Float
half n =
    n / 2



-- dist


dist : Float -> Int -> Float
dist a b =
    sqrt (a ^ 2 + toFloat b ^ 2)



-- view


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text ("str=" ++ model.str) ]
        , div [] [ text ("num=" ++ String.fromFloat model.num) ]
        , div [] [ text ("num1=" ++ String.fromInt model.num1) ]
        , button [ onClick Repeat ] [ text "repeat str" ]
        , button [ onClick Half ] [ text "half num" ]
        , button [ onClick Dist ] [ text "calc dist" ]
        ]
