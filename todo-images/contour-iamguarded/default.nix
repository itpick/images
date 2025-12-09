{ buildCLIImage, pkgs, lib, ... }:

# Image: contour-iamguarded
# Reference: https://images.chainguard.dev/directory/image/contour-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.contour  # contour-1.33 (1.33.0-r3)

# TODO: Implement contour-iamguarded image
throw "Image 'contour-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.contour;
#   name = "contour-iamguarded";
#   tag = "v${pkgs.contour.version}";
#   entrypoint = [ "${pkgs.contour}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "contour-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
