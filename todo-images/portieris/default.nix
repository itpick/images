{ buildCLIImage, pkgs, lib, ... }:

# Image: portieris
# Reference: https://images.chainguard.dev/directory/image/portieris/overview

# TODO: Implement portieris image
throw "Image 'portieris' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "portieris";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "portieris";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
