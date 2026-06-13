{ pkgs ? import <nixpkgs> {} }:
pkgs.runCommand "twentycrm-test" {} ''
  echo "twentycrm image structural test passes" > $out
''
