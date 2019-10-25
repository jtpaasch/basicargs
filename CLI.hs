module CLI (
    OptSet(..) 
  , defaults
  , optSpecs
  ) where

import Args

-- | Define a custom set of options and their types.
data OptSet = OptSet {
    verbose :: Bool
  , help :: Bool
  } deriving (Show)

-- | Define specs that the 'Args' module will use to find/parse 
-- options in the raw command line arguments.
optSpecs :: [Opt OptSet]
optSpecs = [
    Opt { ids = ["-h", "--help"], handler = \h optSet -> optSet { help = True }}
  , Opt { ids = ["-v", "--verbose"], handler = \v optSet -> optSet {verbose = True }}
  ]

-- | Define a default 'ParsedArgs' record.
defaults :: ParsedArgs OptSet
defaults = ParsedArgs {
    options = OptSet {
        verbose = False
      , help = False
      }
  , positional = []
  }
