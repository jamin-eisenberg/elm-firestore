module Firestore.Types.Bytes exposing (decoder, encoder)

{-|

@docs decoder, encoder

-}

import Firestore.Document as Document
import Json.Decode as Decode
import Json.Encode as Encode


{-| -}
decoder : Decode.Decoder String
decoder =
    Decode.field "bytesValue" Decode.string


{-| -}
encoder : String -> Document.Field
encoder value =
    Document.field <|
        Encode.object
            [ ( "bytesValue", Encode.string value ) ]
