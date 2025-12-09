{ buildCLIImage, pkgs, lib, ... }:

# Image: chisel
# Reference: https://images.chainguard.dev/directory/image/chisel/overview

# Packages available in nixpkgs:
#   pkgs.chisel  # chisel (1.11.3-r2)

# TODO: Implement chisel image
throw "Image 'chisel' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.chisel;
#   name = "chisel";
#   tag = "v${pkgs.chisel.version}";
#   entrypoint = [ "${pkgs.chisel}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "chisel";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
