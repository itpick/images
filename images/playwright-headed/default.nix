# playwright-headed (full Chromium + headless shell)
# See ../playwright/build.nix for shared configuration.

{ nix2container, pkgs, lib, nonRoot, ... }:

import ../playwright-headless/build.nix {
  inherit nix2container pkgs nonRoot;
  headed = true;
}
