{ buildCLIImage, pkgs, lib, ... }:

# Image: headlamp-fips
# Reference: https://images.chainguard.dev/directory/image/headlamp-fips/overview

# TODO: Implement headlamp-fips image
throw "Image 'headlamp-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "headlamp-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "headlamp-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
