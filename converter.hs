{-# LANGUAGE OverloadedStrings #-}

import Data.Text.IO
import qualified Data.Text as T
import Prelude hiding (writeFile, readFile, putStrLn, lines, concat)

name e = e !! 2
role e = e !! 3
color e = e !! 4
organization e = e !! 5
team e = e !! 6

splitEntry line = T.split (=='*') line
convertEntryToLatex e = T.concat [("\\makebadge{"), name e, "}{", team e, "}{",
                                  organization e, "}{", role e, "}{", color e, "}"]

escapedCharacters = [("#",  "\\#"),
                     ("$",  "\\$"),
                     ("%",  "\\%"),
                     ("&",  "\\&"),
                     ("\"", "\\textbackslash{}"),
                     ("^",  "\\textasciicircum{}"),
                     ("_",  "\\_"),
                     ("{",  "\\{"),
                     ("}",  "\\}"),
                     ("~",  "\\textasciitilde{}")]

escapeForLatex s = foldr f s escapedCharacters
  where f (x, y) acc = T.replace x y acc

main = do
  input <- readFile "nwerc-badges.csv"
  let entries = map (convertEntryToLatex . splitEntry . escapeForLatex) $ T.lines input
  writeFile "contestants.tex" $ T.unlines $ tail entries
