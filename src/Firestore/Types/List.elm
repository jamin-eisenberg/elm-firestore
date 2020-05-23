module Firestore.Types.List exposing (decoder, encoder)

{-|

@docs decoder, encoder

-}

import Firestore.Document.Field as Field
import Json.Decode as Decode
import Json.Encode as Encode


{-| -}
decoder : Decode.Decoder a -> Decode.Decoder (List a)
decoder elementDecoder =
    Decode.field "arrayValue" <| Decode.field "values" <| Decode.list elementDecoder


{-| -}
encoder : List a -> (a -> Field.Field) -> Field.Field
encoder value valueEncoder =
    Field.new <|
        Encode.object
            [ ( "arrayValue"
              , Encode.object
                    [ ( "values"
                      , Encode.list (valueEncoder >> Field.unwrap) value
                      )
                    ]
              )
            ]
