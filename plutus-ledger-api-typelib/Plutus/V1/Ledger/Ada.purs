-- File auto generated by purescript-bridge! --
module Plutus.V1.Ledger.Ada where

import Prelude

import Aeson (Aeson, aesonNull, class DecodeAeson, class EncodeAeson, decodeAeson, encodeAeson)
import Aeson.Decode ((</$\>), (</*\>), (</\>), decode, null)
import Aeson.Encode ((>$<), (>/\<), encode, null)
import Control.Lazy (defer)
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
import Aeson.Decode as D
import Aeson.Encode as E
import Data.Map as Map

newtype Ada = Lovelace BigInt

derive instance Eq Ada

instance Show Ada where
  show a = genericShow a

instance EncodeAeson Ada where
  encodeAeson' x = pure $ E.encode  (E.record {getLovelace: E.value :: _ (BigInt) }) {getLovelace: unwrap x}

instance DecodeAeson Ada where
  decodeAeson x = wrap <<< get (Proxy :: Proxy "getLovelace") <$> D.decode (D.record "getLovelace "{getLovelace: D.value :: _ (BigInt)}) x

derive instance Generic Ada _

derive instance Newtype Ada _



derive newtype instance ToData Ada

derive newtype instance FromData Ada

--------------------------------------------------------------------------------

_Lovelace :: Iso' Ada BigInt
_Lovelace = _Newtype
