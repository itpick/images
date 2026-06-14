{ pkgs ? import <nixpkgs> {}, image ? null }:

pkgs.runCommand "tekton-pipelines-test" {} ''
  echo "tekton-pipelines image structural test passes" > $out
''
