
module Main exposing (main)

import Browser
import Html exposing (Html, button, div, h1, p, text)
import Html.Events exposing (onClick)


main =
    div []
        [ h1 [] [ text "Hello, Elm!" ]
        , p [] [ text "This is a simple Elm application." ]
        ]
