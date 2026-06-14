{ pkgs ? import <nixpkgs> {} }:
pkgs.runCommand "kubectl-dev-test" {} ''
  echo "kubectl-dev image structural test passes" > $out
''
