{ buildCLIImage, pkgs, lib, ... }:

# Image: fluent-bit-fips
# Reference: https://images.chainguard.dev/directory/image/fluent-bit-fips/overview

# TODO: Implement fluent-bit-fips image
throw "Image 'fluent-bit-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "fluent-bit-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "fluent-bit-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
