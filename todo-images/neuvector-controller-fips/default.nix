{ buildCLIImage, pkgs, lib, ... }:

# Image: neuvector-controller-fips
# Reference: https://images.chainguard.dev/directory/image/neuvector-controller-fips/overview

# TODO: Implement neuvector-controller-fips image
throw "Image 'neuvector-controller-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "neuvector-controller-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "neuvector-controller-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
