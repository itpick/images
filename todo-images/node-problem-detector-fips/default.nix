{ buildCLIImage, pkgs, lib, ... }:

# Image: node-problem-detector-fips
# Reference: https://images.chainguard.dev/directory/image/node-problem-detector-fips/overview

# TODO: Implement node-problem-detector-fips image
throw "Image 'node-problem-detector-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "node-problem-detector-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "node-problem-detector-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
