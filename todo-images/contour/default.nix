{ buildCLIImage, pkgs, lib, ... }:

# Image: contour
# Reference: https://images.chainguard.dev/directory/image/contour/overview

# Packages available in nixpkgs:
#   pkgs.contour  # contour-1.33 (1.33.0-r3)

# TODO: Implement contour image
throw "Image 'contour' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.contour;
#   name = "contour";
#   tag = "v${pkgs.contour.version}";
#   entrypoint = [ "${pkgs.contour}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "contour";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
