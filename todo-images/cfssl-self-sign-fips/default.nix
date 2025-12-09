{ buildCLIImage, pkgs, lib, ... }:

# Image: cfssl-self-sign-fips
# Reference: https://images.chainguard.dev/directory/image/cfssl-self-sign-fips/overview

# TODO: Implement cfssl-self-sign-fips image
throw "Image 'cfssl-self-sign-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cfssl-self-sign-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cfssl-self-sign-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
