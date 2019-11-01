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
  , name :: Maybe String
  } deriving (Show)

-- | Define specs that the 'Args' module will use to find/parse 
-- options in the raw command line arguments.
optSpecs :: [Opt OptSet]
optSpecs = [
    Opt {
        ids = ["-h", "--help"]
      , flag = True
      , handler = \h optSet _ -> optSet { help = True }
      }
  , Opt { 
        ids = ["-v", "--verbose"]
      , flag = True
      , handler = \v optSet _ -> optSet {verbose = True }
      }
  , Opt {
        ids = ["-n", "--name"]
      , flag = False
      , handler = \n optSet args -> optSet { name = Just (head args) }
      }
  ]

-- | Define a default 'ParsedArgs' record.
defaults :: ParsedArgs OptSet
defaults = ParsedArgs {
    options = OptSet {
        verbose = False
      , help = False
      , name = Nothing
      }
  , invalid = []
  , positional = []
  }
