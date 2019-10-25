module Args (
    parse
  , Opt(..)
  , ParsedArgs(..)
  ) where

data ParsedArgs a = ParsedArgs {
    options :: a
  , positional :: [String]
}

data Opt a = Opt {
    ids :: [String] 
  , handler :: String -> a -> a
  }

findOpt :: String -> [Opt a] -> Maybe (Opt a)
findOpt ident [] = Nothing
findOpt ident (x:xs) =
  case ident `elem` (ids x) of
    True -> Just x
    False -> findOpt ident xs

parse :: [String] -> [Opt a] -> ParsedArgs a -> ParsedArgs a
parse [] args acc = 
  let positionalArgs = reverse (positional acc)
   in acc { positional = positionalArgs }
parse (ident:idents) opts acc =
  case findOpt ident opts of
    Just opt ->
      let handle = handler opt
          newOpts = handle ident (options acc)
          newAcc = acc { options = newOpts }
       in parse idents opts newAcc
    Nothing -> 
      let newPositional = ident:(positional acc)
          newAcc = acc { positional = newPositional } 
       in parse idents opts newAcc

