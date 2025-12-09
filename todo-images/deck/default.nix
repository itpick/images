{ buildCLIImage, pkgs, lib, ... }:

# Image: deck
# Reference: https://images.chainguard.dev/directory/image/deck/overview

# Packages available in nixpkgs:
#   pkgs.deck  # deck (1.54.0-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.jq  # jq (1.8.1-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.oniguruma  # oniguruma (6.9.10-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement deck image
throw "Image 'deck' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.deck;
#   name = "deck";
#   tag = "v${pkgs.deck.version}";
#   entrypoint = [ "${pkgs.deck}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "deck";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
