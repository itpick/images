# playwright (headless shell only)
# See build.nix for shared configuration.

{ nix2container, pkgs, lib, nonRoot, ... }:

import ./build.nix {
  inherit nix2container pkgs nonRoot;
  headed = false;
}
