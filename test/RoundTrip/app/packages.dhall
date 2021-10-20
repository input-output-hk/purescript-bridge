let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.14.4-20211005/packages.dhall sha256:2ec351f17be14b3f6421fbba36f4f01d1681e5c7f46e0c981465c4cf222de5be

in  upstream // {
  json-helpers =
    { dependencies =
      [ "argonaut-codecs"
      , "argonaut-core"
      , "arrays"
      , "bifunctors"
      , "contravariant"
      , "control"
      , "either"
      , "enums"
      , "foreign-object"
      , "maybe"
      , "newtype"
      , "ordered-collections"
      , "prelude"
      , "profunctor"
      , "psci-support"
      , "record"
      , "transformers"
      , "tuples"
      , "typelevel-prelude"
      ]
    , repo = "https://github.com/input-output-hk/purescript-bridge-json-helpers.git"
    , version = "68265aaacc1a56c00a7625d424ff13d619681e5e"
    }
}