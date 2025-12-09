{ buildCLIImage, pkgs, lib, ... }:

# Image: bento
# Reference: https://images.chainguard.dev/directory/image/bento/overview

# Packages available in nixpkgs:
#   pkgs.bento  # bento (1.13.1-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement bento image
throw "Image 'bento' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.bento;
#   name = "bento";
#   tag = "v${pkgs.bento.version}";
#   entrypoint = [ "${pkgs.bento}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "10001";
#
#   labels = {
#     "org.opencontainers.image.title" = "bento";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
