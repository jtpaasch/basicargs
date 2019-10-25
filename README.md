# Basic args

A little library to parse command line arguments.
The example resides in `Main.hs`.

To run it:

    runhaskell Main.hs foo bar -v bip bap --help

The main parsing module is `Args.hs`.

A custom set of options and handlers for those options are
defined in `CLI.hs`.

Both `Args` and `CLI` are then imported into `Main.hs`,
where the raw command line arguments are parsed with `parse`
(from `Args`). The result is a `ParsedArgs` record, that has
`options` and `positional` arguments.
