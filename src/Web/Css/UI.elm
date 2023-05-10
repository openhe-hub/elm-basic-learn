module Web.Css.UI exposing(..)

-- 导入相关模块
import Browser
import Element exposing (Element, el, text, centerY, centerX, fill, column, spacing, row, alignRight)
import Element.Font as Font
import Element.Background as Background
import Element.Border as Border
import Element.Events as Events
import Element.Input as Input

-- main =
--     Browser.sandbox
--         { init = init
--         , view = view
--         , update = update
--         }

-- 定义消息类型
type Msg
    = Increment
    | Decrement

-- 定义 model
type alias Model =
    { counter : Int }

init : Model
init =
    { counter = 0 }

-- 定义 update 函数
update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | counter = model.counter + 1 }

        Decrement ->
            { model | counter = model.counter - 1 }

-- 定义 view 函数
view : Model -> Element Msg
view model =
    column [ centerX, centerY, spacing 30 ]
        [ el [ centerX, centerY, Background.color <| Element.rgb255 240 240 240, Border.rounded 10, Font.size 24 ]
            (text "欢迎使用 Elm!")
        , row [ centerX, centerY, spacing 20 ]
            [ Input.button [ Events.onClick Decrement ] { label = el [] (text "-"), onPress = Nothing }
            , el [ Font.size 20, centerX ] (text (String.fromInt model.counter))
            , Input.button [ Events.onClick Increment ] { label = el [] (text "+"), onPress = Nothing }
            ]
        ]

-- 定义 main 函数

