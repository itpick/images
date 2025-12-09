{ buildCLIImage, pkgs, lib, ... }:

# Image: spire-controller-manager-fips
# Reference: https://images.chainguard.dev/directory/image/spire-controller-manager-fips/overview

# TODO: Implement spire-controller-manager-fips image
throw "Image 'spire-controller-manager-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "spire-controller-manager-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "spire-controller-manager-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
