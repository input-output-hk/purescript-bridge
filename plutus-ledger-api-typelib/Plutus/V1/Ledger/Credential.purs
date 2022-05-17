-- File auto generated by purescript-bridge! --
module Plutus.V1.Ledger.Credential where

import Prelude

import Data.BigInt (BigInt)
import Data.Generic.Rep (class Generic)
import Data.Lens (Iso', Lens', Prism', iso, prism')
import Data.Lens.Iso.Newtype (_Newtype)
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(Nothing, Just))
import Data.Show.Generic (genericShow)
import Data.Tuple (Tuple(Tuple))
import FromData (class FromData, genericFromData)
import Plutus.V1.Ledger.Crypto (PubKeyHash)
import Plutus.V1.Ledger.Scripts (ValidatorHash)
import ToData (class ToData, genericToData)
import Type.Proxy (Proxy(Proxy))
import TypeLevel.DataSchema
  ( ApPCons
  , Field
  , I
  , Id
  , IxK
  , MkField
  , MkField_
  , MkIxK
  , MkIxK_
  , PCons
  , PNil
  , PSchema
  , class HasPlutusSchema
  , type (:+)
  , type (:=)
  , type (@@)
  )
import TypeLevel.Nat (S, Z)

data StakingCredential
  = StakingHash Credential
  | StakingPtr BigInt BigInt BigInt

instance Show StakingCredential where
  show a = genericShow a

derive instance Generic StakingCredential _

instance
  HasPlutusSchema StakingCredential
    ( "StakingHash" := PNil
        @@ (Z)
        :+ "StakingPtr"
        := PNil
        @@ (S (Z))
        :+ PNil
    )

instance ToData StakingCredential where
  toData x = genericToData x

instance FromData StakingCredential where
  fromData x = genericFromData x

--------------------------------------------------------------------------------

_StakingHash :: Prism' StakingCredential Credential
_StakingHash = prism' StakingHash case _ of
  (StakingHash a) -> Just a
  _ -> Nothing

_StakingPtr
  :: Prism' StakingCredential { a :: BigInt, b :: BigInt, c :: BigInt }
_StakingPtr = prism' (\{ a, b, c } -> (StakingPtr a b c)) case _ of
  (StakingPtr a b c) -> Just { a, b, c }
  _ -> Nothing

--------------------------------------------------------------------------------

data Credential
  = PubKeyCredential PubKeyHash
  | ScriptCredential ValidatorHash

instance Show Credential where
  show a = genericShow a

derive instance Generic Credential _

instance
  HasPlutusSchema Credential
    ( "PubKeyCredential" := PNil
        @@ (Z)
        :+ "ScriptCredential"
        := PNil
        @@ (S (Z))
        :+ PNil
    )

instance ToData Credential where
  toData x = genericToData x

instance FromData Credential where
  fromData x = genericFromData x

--------------------------------------------------------------------------------

_PubKeyCredential :: Prism' Credential PubKeyHash
_PubKeyCredential = prism' PubKeyCredential case _ of
  (PubKeyCredential a) -> Just a
  _ -> Nothing

_ScriptCredential :: Prism' Credential ValidatorHash
_ScriptCredential = prism' ScriptCredential case _ of
  (ScriptCredential a) -> Just a
  _ -> Nothing