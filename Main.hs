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
  putStrLn $ "Verbose: " ++ (show verbose_opt)
  putStrLn $ "Help: " ++ (show help_opt)
  putStrLn $ "Positional args: " ++ (intercalate ", " pos)
  putStrLn "Done."
