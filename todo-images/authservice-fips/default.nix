{ buildCLIImage, pkgs, lib, ... }:

# Image: authservice-fips
# Reference: https://images.chainguard.dev/directory/image/authservice-fips/overview

# TODO: Implement authservice-fips image
throw "Image 'authservice-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "authservice-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "authservice-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
