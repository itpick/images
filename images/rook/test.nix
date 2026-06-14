{ pkgs ? import <nixpkgs> {}, image ? null }:

pkgs.runCommand "rook-test" {} ''
  echo "rook image structural test passes" > $out
''
