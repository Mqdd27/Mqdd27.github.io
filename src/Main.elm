module Main exposing (main)

import Html exposing (Html, a, div, h1, h2, h3, hr, li, p, section, text, ul)
import Html.Attributes exposing (class, href, target)



-- DATA


type alias Exp =
    { company : String
    , period : String
    , points : List String
    }


type alias Proj =
    { title : String
    , description : String
    , technologies : List String
    , links : String
    }


experiences : List Exp
experiences =
    [ { company = "PT. Asiatek Solusi Indonesia Assigned to Mayapada Hospital"
      , period = "2026 - Present"
      , points =
            [ "Develop E-Procurement Module for Purchasing and Accounting Division"
            , "Integrate E-Procurement Module with existing HIS System (Arcus, TrackCare, dHealth, etc)"
            ]
      }
    , { company = "PT. Indoteknik Dotcom Gemilang and PT. Fixco Karya Nusantara"
      , period = "2025 - 2026"
      , points =
            [ "Develop Maintain Indoteknik.com website and ERP System"
            , "Built automated return and exchange workflows to reduce manual operations"
            , "Built logistics and locator applications with Next.js integrated to Odoo"
            , "Handled Odoo deployment, maintenance, troubleshooting, and lead optimization on Linux servers"
            , "Develop and Migrate Fixco ERP System from Accurate ERP to Odoo ERP"
            , "Integrate Odoo Fixco with Ginee Marketplace"
            , "Built service monitoring, event management, and async queue-based processing"
            ]
      }
    ]


projects : List Proj
projects =
    [ { title = "IDX Stocks Dashboard"
      , description = "Self-hosted equity research platform for monitoring IDX stocks."
      , technologies = [ "Next.js", "TailwindCSS", "Chart.js" ]
      , links = "https://github.com/Risen-Dev/idx-stocks-dashboard"
      }
    , { title = "Automatic Returns Module"
      , description = "Custom Odoo workflow to handle sales and purchase returns more consistently."
      , technologies = [ "Odoo", "Python" ]
      , links = ""
      }
    , { title = "Logistics and Locator Application"
      , description = "Custom locator application to track and manage products locations in Odoo."
      , technologies = [ "Next.js", "Odoo API" ]
      , links = ""
      }
    , { title = "Digital Board"
      , description = "Self-hosted digital board for team management and communication, trello alternative."
      , technologies = [ "Next.js", "lucide react" ]
      , links = "https://github.com/Risen-Dev/digital-board"
      }
    , { title = "Summarizer"
      , description = "Self-hosted summarizer application to summarize long articles and documents using OpenAI API."
      , technologies = [ "Flask", "Python" ]
      , links = "https://github.com/Risen-Dev/summarizer"
      }
    ]



-- VIEW


main : Html msg
main =
    div [ class "page" ]
        [ h1 [] [ text "~*~ Ahmad Miqdad ~*~" ]
        , Html.node "marquee" [] [ text "Welcome to my homepage! Odoo Developer and IT professional." ]
        , viewWindow "Work Experiences" (List.map viewExp experiences)
        , viewWindow "Projects" (List.map viewProj projects)
        , hr [] []
        , p [ class "footer" ] [ text "© Mqdd" ]
        ]


viewWindow : String -> List (Html msg) -> Html msg
viewWindow title content =
    section [ class "window" ]
        [ h2 [ class "title-bar" ] [ text title ]
        , div [ class "window-body" ] content
        ]


viewExp : Exp -> Html msg
viewExp exp =
    div []
        [ h3 [] [ text (exp.company ++ " (" ++ exp.period ++ ")") ]
        , ul [] (List.map viewPoint exp.points)
        ]


viewPoint : String -> Html msg
viewPoint point =
    li [] [ text point ]


viewProj : Proj -> Html msg
viewProj proj =
    div []
        [ h3 [] [ text proj.title ]
        , p [] [ text proj.description ]
        , p [] [ text ("Tech: " ++ String.join ", " proj.technologies) ]
        , if proj.links /= "" then
            p [] [ text "Links: ", a [ href proj.links, target "_blank" ] [ text proj.links ] ]
          else
            text ""
        ]
