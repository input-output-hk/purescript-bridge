{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TypeApplications #-}

module RoundTrip.Types where

import Control.Applicative ((<|>))
import Data.Aeson (FromJSON, ToJSON)
import Data.Proxy (Proxy (..))
import GHC.Generics (Generic)
import Language.PureScript.Bridge (BridgePart, Language (..), SumType, buildBridge, defaultBridge, defaultSwitch, mkSumType, writePSTypes, writePSTypesWith)
import Language.PureScript.Bridge.TypeParameters (A)
import System.Directory (removeDirectoryRecursive, removeFile, withCurrentDirectory)
import System.Exit (ExitCode (ExitSuccess))
import System.Process (readProcessWithExitCode)
import Test.HUnit (assertEqual)
import Test.Hspec (Spec, aroundAll_, describe, it)
import Test.Hspec.Expectations.Pretty (shouldBe)
import Test.QuickCheck (Arbitrary (..), chooseEnum, oneof)

data TestData
  = Maybe (Maybe TestSum)
  | Either (Either (Maybe Int) (Maybe Bool))
  deriving (Show, Eq, Ord, Generic)

instance FromJSON TestData

instance ToJSON TestData

instance Arbitrary TestData where
  arbitrary =
    oneof
      [ Maybe <$> arbitrary,
        Either <$> arbitrary
      ]

data TestSum
  = Nullary
  | Bool Bool
  | Int Int
  | Number Double
  | String String
  | Array [Int]
  | Record (TestRecord Int)
  | NestedRecord (TestRecord (TestRecord Int))
  | NT TestNewtype
  | NTRecord TestNewtypeRecord
  | Unit ()
  | MyUnit MyUnit
  | Pair (Int, Double)
  | Triple (Int, (), Bool)
  | Quad (Int, Double, Bool, Double)
  | QuadSimple Int Double Bool Double
  | Enum TestEnum
  deriving (Show, Eq, Ord, Generic)

instance FromJSON TestSum

instance ToJSON TestSum

instance Arbitrary TestSum where
  arbitrary =
    oneof
      [ pure Nullary,
        Bool <$> arbitrary,
        Int <$> arbitrary,
        Number <$> arbitrary,
        String <$> arbitrary,
        Array <$> arbitrary,
        Record <$> arbitrary,
        NestedRecord <$> arbitrary,
        NT <$> arbitrary,
        NTRecord <$> arbitrary,
        pure $ Unit (),
        Pair <$> arbitrary,
        Triple <$> arbitrary,
        Quad <$> arbitrary,
        QuadSimple <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary,
        Enum <$> arbitrary
      ]

data TestRecord a = TestRecord
  { _field1 :: Maybe Int,
    _field2 :: a
  }
  deriving (Show, Eq, Ord, Generic)

instance (FromJSON a) => FromJSON (TestRecord a)

instance (ToJSON a) => ToJSON (TestRecord a)

instance (Arbitrary a) => Arbitrary (TestRecord a) where
  arbitrary = TestRecord <$> arbitrary <*> arbitrary

newtype TestNewtype = TestNewtype (TestRecord Bool)
  deriving (Show, Eq, Ord, Generic)

instance FromJSON TestNewtype

instance ToJSON TestNewtype

instance Arbitrary TestNewtype where
  arbitrary = TestNewtype <$> arbitrary

newtype TestNewtypeRecord = TestNewtypeRecord {unTestNewtypeRecord :: TestNewtype}
  deriving (Show, Eq, Ord, Generic)

instance FromJSON TestNewtypeRecord

instance ToJSON TestNewtypeRecord

instance Arbitrary TestNewtypeRecord where
  arbitrary = TestNewtypeRecord <$> arbitrary

data TestEnum
  = Mon
  | Tue
  | Wed
  | Thu
  | Fri
  | Sat
  | Sun
  deriving (Show, Eq, Ord, Bounded, Enum, Generic)

instance FromJSON TestEnum

instance ToJSON TestEnum

instance Arbitrary TestEnum where
  arbitrary = chooseEnum (minBound, maxBound)

data MyUnit = U deriving (Show, Eq, Ord, Bounded, Enum, Generic)

instance FromJSON MyUnit

instance ToJSON MyUnit

instance Arbitrary MyUnit where
  arbitrary = pure U