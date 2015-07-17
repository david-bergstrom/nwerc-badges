This is the script and LaTeX document that was used to generate the
badges for NWERC 2014.

The Haskell script converts the contestant data stored in a csv file
to a LaTeX file which then is compiled to a pdf using xelatex.

A '*' was used instead of comma in the csv file because it was the
only character not used in any of the contestants Team Names.

XeLaTeX was used instead of LaTeX because it handled the different
team names the best but the document should work with other compiler
with little or no modifications.
