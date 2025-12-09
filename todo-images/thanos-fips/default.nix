{ buildCLIImage, pkgs, lib, ... }:

# Image: thanos-fips
# Reference: https://images.chainguard.dev/directory/image/thanos-fips/overview

# TODO: Implement thanos-fips image
throw "Image 'thanos-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "thanos-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "thanos-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
