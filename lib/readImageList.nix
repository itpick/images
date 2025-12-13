# Read image names from a text file (one per line)
# Filters out comments (lines starting with #) and empty lines
# Returns a list of image names

{ lib }:

listFile:
  let
    content = builtins.readFile listFile;
    lines = lib.splitString "\n" content;
    # Filter out empty lines and comments
    validLines = builtins.filter (line:
      let trimmed = lib.trim line;
      in trimmed != "" && !(lib.hasPrefix "#" trimmed)
    ) lines;
  in
    validLines
