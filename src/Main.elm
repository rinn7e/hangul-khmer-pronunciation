module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import List.Extra exposing (..)
import Dict
import Char


main : Program Never Model Msg
main =
    Html.program
        { init = ( model, Cmd.none )
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Model =
    { input : String
    , translate : String
    , khmer : List ( String, String )
    , tutorial : Bool
    , listTest : List ( Char.KeyCode, List Char.KeyCode )
    , head : Dict.Dict Char String
    , vowel : Dict.Dict Char String
    , tail : Dict.Dict Char String
    }


model : Model
model =
    { input = "Tiger J.K – Reset Hangul\n내 맘에 깊이 가득 차버린\n공허한 세상 나를 구해줘\nI wanna reset (x3)"
    , translate = "អ្វីដែលសរសេរនឹងចេញនៅទីនេះ"
    , khmer = [ ( "T", "T" ), ( "i", "i" ), ( "g", "g" ), ( "e", "e" ), ( "r", "r" ), ( " ", " " ), ( "J", "J" ), ( ".", "." ), ( "K", "K" ), ( " ", " " ), ( "–", "–" ), ( " ", " " ), ( "R", "R" ), ( "e", "e" ), ( "s", "s" ), ( "e", "e" ), ( "t", "t" ), ( " ", " " ), ( "H", "H" ), ( "a", "a" ), ( "n", "n" ), ( "g", "g" ), ( "u", "u" ), ( "l", "l" ), ( "\n", "\n" ), ( "내", "ណេ" ), ( " ", " " ), ( "맘", "ម៉ាម" ), ( "에", "អេ" ), ( " ", " " ), ( "깊", "ខុីប" ), ( "이", "អុី" ), ( " ", " " ), ( "가", "ខា" ), ( "득", "ថុឺក" ), ( " ", " " ), ( "차", "ឆា" ), ( "버", "ផ" ), ( "린", "រ៉ុីន" ), ( "\n", "\n" ), ( "공", "ខូង" ), ( "허", "ហ" ), ( "한", "ហាន" ), ( " ", " " ), ( "세", "សេ" ), ( "상", "សាង" ), ( " ", " " ), ( "나", "ណា" ), ( "를", "រ៉ុឺល" ), ( " ", " " ), ( "구", "ខ៊ូ" ), ( "해", "ហេ" ), ( "줘", "ឆ្វ" ), ( "\n", "\n" ), ( "I", "I" ), ( " ", " " ), ( "w", "w" ), ( "a", "a" ), ( "n", "n" ), ( "n", "n" ), ( "a", "a" ), ( " ", " " ), ( "r", "r" ), ( "e", "e" ), ( "s", "s" ), ( "e", "e" ), ( "t", "t" ), ( " ", " " ), ( "(", "(" ), ( "x", "x" ), ( "3", "3" ), ( ")", ")" ) ]
    , tutorial = False
    , listTest = []
    , head =
        Dict.fromList
            [ ( 'ᄀ', "ខ" )
            , ( 'ᄁ', "ក" )
            , ( 'ᄂ', "ណ" )
            , ( 'ᄃ', "ថ" )
            , ( 'ᄄ', "ត" )
            , ( 'ᄅ', "រ៉" )
            , ( 'ᄆ', "ម៉" )
            , ( 'ᄇ', "ផ" )
            , ( 'ᄈ', "ប៉" )
            , ( 'ᄉ', "ស" )
            , ( 'ᄊ', "ស" )
            , ( 'ᄋ', "អ" )
            , ( 'ᄌ', "ឆ" )
            , ( 'ᄍ', "ច" )
            , ( 'ᄎ', "ឆ" )
            , ( 'ᄏ', "ខ" )
            , ( 'ᄐ', "ថ" )
            , ( 'ᄑ', "ផ" )
            , ( 'ᄒ', "ហ" )
            ]
    , vowel =
        Dict.fromList
            [ ( 'ᅡ', "ា" )
            , ( 'ᅢ', "េ" )
            , ( 'ᅣ', "្យា" )
            , ( 'ᅤ', "្យេ" )
            , ( 'ᅥ', "" )
            , ( 'ᅦ', "េ" )
            , ( 'ᅧ', "្យ" )
            , ( 'ᅨ', "្យេ" )
            , ( 'ᅩ', "ូ" )
            , ( 'ᅪ', "្វា" )
            , ( 'ᅫ', "្វេ" )
            , ( 'ᅬ', "្វេ" )
            , ( 'ᅭ', "្យូ" )
            , ( 'ᅮ', "៊ូ" )
            , ( 'ᅯ', "្វ" )
            , ( 'ᅰ', "្វេ" )
            , ( 'ᅱ', "្វី" )
            , ( 'ᅲ', "្យ៊ូ" )
            , ( 'ᅳ', "ុឺ" )
            , ( 'ᅴ', "ុឺ" )
            , ( 'ᅵ', "ុី" )
            ]
    , tail =
        Dict.fromList
            [ ( 'ᆨ', "ក" )
            , ( 'ᆩ', "ក" )
            , ( 'ᆪ', "ក" )
            , ( 'ᆫ', "ន" )
            , ( 'ᆬ', "នឆ៍" )
            , ( 'ᆭ', "នហ៍" )
            , ( 'ᆮ', "ត" )
            , ( 'ᄄ', "ត" )
            , ( 'ᆯ', "ល" )
            , ( 'ᆰ', "លក៍" )
            , ( 'ᆱ', "លម៍" )
            , ( 'ᆲ', "លប៍" )
            , ( 'ᆳ', "លត៍" )
            , ( 'ᆴ', "លថ៍" )
            , ( 'ᆵ', "លផ៍" )
            , ( 'ᆶ', "លហ៍" )
            , ( 'ᆷ', "ម" )
            , ( 'ᆸ', "ប" )
              -- this is actually ㅄ
            , ( 'ᆹ', "បត៍" )
              ----------------------
              -- this is actually ㅅ
            , ( 'ᆺ', "ត" )
              -------------------
              -- this is acutlally ㅆ
            , ( 'ᆻ', "ត" )
              ------------------------
              -- this is actually ㅇ
            , ( 'ᆼ', "ង" )
              ----------------------------
              -- this is actually ㅈ
            , ( 'ᆽ', "ត" )
              ----------------------
            , ( 'ᆾ', "ត" )
            , ( 'ᆿ', "ក" )
            , ( 'ᇀ', "ត" )
            , ( 'ᇁ', "ប" )
            , ( 'ᇂ', "ត" )
            ]
    }


type Msg
    = UserInput String



-- getCurrentIndex : Model -> Int
-- getCurrentIndex model =
--   { model | todo = { modelTodo | index } }


decomposeHangul hangul =
    let
        keyCode =
            Char.toCode hangul
    in
        if keyCode >= 40000 then
            let
                lead =
                    1 + (truncate ((toFloat (keyCode - 44032)) / 588))

                tail =
                    ((%) (keyCode - 44032) 28)

                -- trueTail =
                --     if tail == 0 then
                --         37
                --     else
                --         4519 + tail
                vowel =
                    truncate ((1 + ((toFloat ((%) (keyCode - 44032 - tail) 588)) / 28)))
            in
                if tail == 0 then
                    ( keyCode, [ 4351 + lead, 4448 + vowel ] )
                else
                    ( keyCode, [ 4351 + lead, 4448 + vowel, 4519 + tail ] )
            -- [ lead, vowel, tail ]
        else
            ( keyCode, keyCode :: [] )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        akharakroms =
            Dict.fromList [ ( "Tom", "Cat" ), ( "Jerry", "Mouse" ) ]
    in
        case msg of
            UserInput text ->
                let
                    listText =
                        String.toList text

                    translateText =
                        List.map (\x -> decomposeHangul x) listText

                    -- resultList =
                    --     List.Extra.intercalate [] translateText
                    test =
                        translateText
                            |> List.map
                                (\charList ->
                                    let
                                        origin =
                                            Tuple.first charList

                                        jamoList =
                                            Tuple.second charList

                                        resultList =
                                            jamoList
                                                |> List.map
                                                    (\jamo ->
                                                        (String.fromList [ Char.fromCode jamo ])
                                                    )
                                    in
                                        ( String.fromList [ Char.fromCode origin ], resultList )
                                )

                    result =
                        translateText
                            |> List.map
                                (\charList ->
                                    let
                                        origin =
                                            Tuple.first charList

                                        jamoList =
                                            Tuple.second charList

                                        khmerChar =
                                            if (List.length jamoList >= 2) then
                                                let
                                                    -- char =
                                                    --     Char.fromCode x
                                                    jamoHead =
                                                        Maybe.withDefault (-1) (List.Extra.getAt 0 jamoList)

                                                    jamoVowel =
                                                        Maybe.withDefault (-1) (List.Extra.getAt 1 jamoList)

                                                    jamoTail =
                                                        Maybe.withDefault (-1) (List.Extra.getAt 2 jamoList)

                                                    khmerHead =
                                                        Maybe.withDefault (String.fromList [ Char.fromCode jamoHead ]) (Dict.get (Char.fromCode jamoHead) model.head)

                                                    khmerVowel =
                                                        Maybe.withDefault (String.fromList [ Char.fromCode jamoVowel ]) (Dict.get (Char.fromCode jamoVowel) model.vowel)

                                                    khmerTail =
                                                        Maybe.withDefault (String.fromList [ Char.fromCode jamoTail ]) (Dict.get (Char.fromCode jamoTail) model.tail)
                                                in
                                                    if jamoTail == -1 then
                                                        [ khmerHead, khmerVowel ]
                                                    else
                                                        [ khmerHead, khmerVowel, khmerTail ]
                                            else
                                                (List.map (\jamo -> (String.fromList [ Char.fromCode jamo ]))) jamoList
                                    in
                                        ( String.fromList [ Char.fromCode origin ]
                                        , khmerChar
                                            |> String.join ""
                                        )
                                 -- if (List.length jamoList >= 2) then
                                 --     let
                                 --         -- char =
                                 --         --     Char.fromCode x
                                 --         jamoHead =
                                 --             Maybe.withDefault (-1) (List.Extra.getAt 0 jamoList)
                                 --
                                 --         jamoVowel =
                                 --             Maybe.withDefault (-1) (List.Extra.getAt 1 jamoList)
                                 --
                                 --         jamoTail =
                                 --             Maybe.withDefault (-1) (List.Extra.getAt 2 jamoList)
                                 --
                                 --         khmerHead =
                                 --             Maybe.withDefault (String.fromList [ Char.fromCode jamoHead ]) (Dict.get (Char.fromCode jamoHead) model.head)
                                 --
                                 --         khmerVowel =
                                 --             Maybe.withDefault (String.fromList [ Char.fromCode jamoVowel ]) (Dict.get (Char.fromCode jamoVowel) model.vowel)
                                 --
                                 --         khmerTail =
                                 --             Maybe.withDefault (String.fromList [ Char.fromCode jamoTail ]) (Dict.get (Char.fromCode jamoTail) model.tail)
                                 --     in
                                 --         if jamoTail == -1 then
                                 --             [ khmerHead, khmerVowel, "|" ]
                                 --         else
                                 --             [ khmerHead, khmerVowel, khmerTail, "|" ]
                                 -- else
                                 --     (List.map (\jamo -> (String.fromList [ Char.fromCode jamo ]))) jamoList
                                )

                    -- |> List.Extra.intercalate []
                    -- |> String.join ""
                in
                    ( { model
                        | input =
                            text
                        , listTest = translateText
                        , translate = toString result
                        , khmer = result
                      }
                    , Cmd.none
                    )


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h3 [] [ text "Hangul Pronuciation in Khmer" ]
        , div [] [ text "សរសេរកូរ៉េនៅក្រោមនេះ" ]
        , div [ class "well" ]
            [ textarea
                [ value model.input
                , onInput UserInput
                  -- , placeholder "សរសេរនៅទីនេះ"
                , class "form-control"
                , rows 5
                  -- , Html.Attributes.style
                  --     [ ( "height", "90px" )
                  --     , ( "width", "100%" )
                  --     ]
                ]
                []
            ]
          -- , div [] [ text (toString model.listTest) ]
        , hr [] []
        , div [ class "panel panel-primary" ]
            [ div [ class "panel-heading" ]
                [ h3 [ class "panel-title" ] [ text "លទ្ធិផល" ]
                ]
              -- , div [ class "panel-body output " ]
              --     [ text model.translate
              --     ]
              -- , hr [] []
            , div [ class "panel-body output clearfix" ]
                (List.map singleLetter model.khmer)
            ]
        , Html.span []
            [ text "created by "
            , a [ target "_blank", href "https://github.com/chmar77/hangul-khmer-pronunciation" ] [ text "chmar77" ]
            ]
        ]


singleLetter khmerTuple =
    let
        cond =
            if (Tuple.first khmerTuple) == " " then
                div [ class "space" ] []
            else
                div [] []

        newline =
            if (Tuple.first khmerTuple) == "\n" then
                " newline"
            else
                ""
    in
        div [ class ("lyric-item" ++ newline) ]
            [ cond
            , div [ class "khmer" ] [ Html.span [] [ text (Tuple.second khmerTuple) ] ]
            , div [ class "korean" ] [ text (Tuple.first khmerTuple) ]
            ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
