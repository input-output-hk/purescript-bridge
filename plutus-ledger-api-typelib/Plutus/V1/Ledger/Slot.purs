-- File auto generated by purescript-bridge! --
module Plutus.V1.Ledger.Slot where

import Prelude

import Aeson
  ( Aeson
  , aesonNull
  , class DecodeAeson
  , class EncodeAeson
  , decodeAeson
  , encodeAeson
  )
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

newtype Slot = Slot BigInt

instance Show Slot where
  show a = genericShow a

derive instance Eq Slot

derive instance Ord Slot

derive instance Generic Slot _

derive instance Newtype Slot _

derive newtype instance ToData Slot

derive newtype instance FromData Slot

instance EncodeAeson Slot where
  encodeAeson x = E.encode (E.record { getSlot: E.value :: _ (BigInt) })
    { getSlot: unwrap x }

instance DecodeAeson Slot where
  decodeAeson x = wrap <<< get (Proxy :: Proxy "getSlot") <$> D.decode
    (D.record "getSlot " { getSlot: D.value :: _ (BigInt) })
    x

--------------------------------------------------------------------------------

_Slot :: Iso' Slot BigInt
_Slot = _Newtype
