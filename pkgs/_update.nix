# Update-tooling entrypoint for `nix-update` — NOT imported by flake.nix.
#
# The custom packages in ./default.nix are exposed to the flake only via an
# overlay (see flake.nix: `overlays = [ (final: prev: import ./pkgs { ... }) ]`),
# so they have NO `packages.<system>.<name>` attribute path that
# `nix-update --flake` could target. nix-update's `--file` mode, however,
# imports a file, applies it to a `{ system, ... }` argument (the same calling
# convention as nixpkgs' own default.nix), and then indexes the resulting
# attrset by the package attribute. This file provides exactly that shape:
# every custom package, built with the same overlay the flake uses, as a plain
# derivation whose `src`/`version`/`hash` nix-update can resolve and rewrite in
# place inside pkgs/<name>/default.nix.
#
# Usage (per the auto-update.yml workflow):
#   nix-update -f ./pkgs/_update.nix --version=stable <attr>
#
# The attribute name is the KEY in ./default.nix, which is not always the
# directory name (e.g. `crossplane-server` -> ./crossplane, `cilium-certgen`
# -> ./certgen). The workflow derives the list of attrs from this file so the
# mapping never has to be hardcoded.
{ system ? builtins.currentSystem, ... }:
let
  flake = builtins.getFlake (toString ../.);
  nixpkgs = flake.inputs.nixpkgs;
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [ (final: prev: import ./. { pkgs = final; }) ];
  };
in
import ./. { inherit pkgs; }
