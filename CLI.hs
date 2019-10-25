module CLI (
    OptSet(..) 
  , defaults
  , optSpecs
  ) where

import Args

data OptSet = OptSet {
    verbose :: Bool
  , help :: Bool
  } deriving (Show)

optSpecs :: [Opt OptSet]
optSpecs = [
    Opt { ids = ["-h", "--help"], handler = \h optSet -> optSet { help = True }}
  , Opt { ids = ["-v", "--verbose"], handler = \v optSet -> optSet {verbose = True }}
  ]

defaults :: ParsedArgs OptSet
defaults = ParsedArgs {
    options = OptSet {
        verbose = False
      , help = False
      }
  , positional = []
  }
