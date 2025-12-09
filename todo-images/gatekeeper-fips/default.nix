{ buildCLIImage, pkgs, lib, ... }:

# Image: gatekeeper-fips
# Reference: https://images.chainguard.dev/directory/image/gatekeeper-fips/overview

# TODO: Implement gatekeeper-fips image
throw "Image 'gatekeeper-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "gatekeeper-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "gatekeeper-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
