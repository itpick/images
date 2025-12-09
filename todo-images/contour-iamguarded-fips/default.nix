{ buildCLIImage, pkgs, lib, ... }:

# Image: contour-iamguarded-fips
# Reference: https://images.chainguard.dev/directory/image/contour-iamguarded-fips/overview

# TODO: Implement contour-iamguarded-fips image
throw "Image 'contour-iamguarded-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "contour-iamguarded-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "contour-iamguarded-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
