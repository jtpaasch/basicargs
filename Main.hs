module Main (main) where

import System.Environment (getArgs)
import Data.List (intercalate)

import Args
import CLI

main = do
  rawArgs <- getArgs
  let args = parse rawArgs optSpecs defaults
  let opts = options args
  let pos = positional args
  let verbose_opt = verbose opts
  let help_opt = help opts
  let name_opt = name opts
  putStrLn $ "Verbose: " ++ (show verbose_opt)
  putStrLn $ "Help: " ++ (show help_opt)
  case name_opt of
    Just n -> putStrLn $ "Name: " ++ n
    Nothing -> putStrLn "Name: none given"
  putStrLn $ "Positional args: " ++ (intercalate ", " pos)
  putStrLn "Done."
