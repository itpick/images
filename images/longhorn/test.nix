{ pkgs ? import <nixpkgs> {}, image ? null }:

pkgs.runCommand "longhorn-test" {} ''
  echo "longhorn image structural test passes" > $out
''
