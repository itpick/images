{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-node-termination-handler-fips
# Reference: https://images.chainguard.dev/directory/image/aws-node-termination-handler-fips/overview

# TODO: Implement aws-node-termination-handler-fips image
throw "Image 'aws-node-termination-handler-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "aws-node-termination-handler-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-node-termination-handler-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
