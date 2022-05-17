-- File auto generated by purescript-bridge! --
module Plutus.V1.Ledger.Ada where

import Prelude

import Control.Lazy (defer)
import Data.Argonaut.Core (Json, jsonNull)
import Data.Argonaut.Decode (class DecodeJson, decodeJson)
import Data.Argonaut.Decode.Aeson ((</$\>), (</*\>), (</\>), decode, null)
import Data.Argonaut.Encode (class EncodeJson, encodeJson)
import Data.Argonaut.Encode.Aeson ((>$<), (>/\<), encode, null)
import Data.BigInt (BigInt)
import Data.Generic.Rep (class Generic)
import Data.Lens (Iso', Lens', Prism', iso, prism')
import Data.Lens.Iso.Newtype (_Newtype)
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Newtype (class Newtype, unwrap, wrap)
import Data.Op (Op(Op))
import Data.Show.Generic (genericShow)
import Data.Tuple.Nested ((/\))
import FromData (class FromData, genericFromData)
import Record (get)
import ToData (class ToData, genericToData)
import Type.Proxy (Proxy(Proxy))
import Data.Argonaut.Decode.Aeson as D
import Data.Argonaut.Encode.Aeson as E
import Data.Map as Map

newtype Ada = Lovelace BigInt

instance Show Ada where
  show a = genericShow a

derive instance Generic Ada _

derive instance Newtype Ada _

derive newtype instance ToData Ada

derive newtype instance FromData Ada

instance EncodeJson Ada where
  encodeJson x = E.encode (E.record { getLovelace: E.value :: _ (BigInt) })
    { getLovelace: unwrap x }

instance DecodeJson Ada where
  decodeJson x = wrap <<< get (Proxy :: Proxy "getLovelace") <$> D.decode
    (D.record "getLovelace " { getLovelace: D.value :: _ (BigInt) })
    x

--------------------------------------------------------------------------------

_Lovelace :: Iso' Ada BigInt
_Lovelace = _Newtype