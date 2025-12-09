{ buildCLIImage, pkgs, lib, ... }:

# Image: volcano-fips
# Reference: https://images.chainguard.dev/directory/image/volcano-fips/overview

# TODO: Implement volcano-fips image
throw "Image 'volcano-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "volcano-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "volcano-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
