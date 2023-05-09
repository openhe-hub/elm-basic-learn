-- This is not runnable, import List
-- 1. singleton num
-- > List.singleton 12
-- [12] : List number
-- 2. repeat time element
-- > List.repeat 3 (0,0)
-- [(0,0),(0,0),(0,0)]
--     : List ( number, number1 )
-- 3. range start end
-- > List.range 3 6
-- [3,4,5,6] : List Int
-- 4. :: (append front)
-- > 1 :: [2,3]
-- [1,2,3] : List number
-- 5. map
-- > map sqrt [1,4,9] == [1,2,3]
-- 6. indexedMap
-- >  indexedMap Tuple.pair ["Tom","Sue","Bob"] == [ (0,"Tom"), (1,"Sue"), (2,"Bob") ]
-- 7. foldl
-- > foldl (::)  []  [1,2,3] == [3,2,1]
-- state
--   |> step 1
--   |> step 2
--   |> step 3
-- 8. foldr
-- 9. filter
-- > filter isEven [1,2,3,4,5,6] == [2,4,6]
-- 10. all: Determine if all elements satisfy some test.
-- > all isEven [2,4] == True
-- 11. any: Determine if any elements satisfy some test.
-- > any isEven [1,3] == False
-- 12. maximum/minimum/sum/product/sort/sortBy
-- 13. append/concat/map2


module CoreLib.List exposing (..)

import Browser
import Debug
import Html exposing (..)
import Html.Events exposing (..)
import List



-- main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- model


type alias User =
    { username : String
    , password : String
    , age : Int
    }


type alias Model =
    { users : List User
    }


init : Model
init =
    { users =
        [ { username = "openhe", password = "111", age = 19 }
        , { username = "openhe", password = "111", age = 10 }
        , { username = "openhe", password = "111", age = 28 }
        ]
    }



-- update


type Msg
    = Demo


update : Msg -> Model -> Model
update msg model =
    case msg of
        Demo ->
            let
                newUsers =
                    List.filter (\user -> user.age >= 18)
                        (List.sortBy .age model.users)

                newModel =
                    { model | users = newUsers } |> Debug.log ""
            in
            newModel

-- view


view : Model -> Html Msg
view model =
    button [ onClick Demo ] [ text "run" ]
