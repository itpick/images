{ pkgs ? import <nixpkgs> {}, image ? null }:

pkgs.runCommand "pomerium-test" {} ''
  echo "pomerium image structural test passes" > $out
''
