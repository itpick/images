{ buildCLIImage, pkgs, lib, ... }:

# Image: os-shell-iamguarded-fips
# Reference: https://images.chainguard.dev/directory/image/os-shell-iamguarded-fips/overview

# TODO: Implement os-shell-iamguarded-fips image
throw "Image 'os-shell-iamguarded-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "os-shell-iamguarded-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "os-shell-iamguarded-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
