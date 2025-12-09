{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-for-fluent-bit
# Reference: https://images.chainguard.dev/directory/image/aws-for-fluent-bit/overview

# TODO: Implement aws-for-fluent-bit image
throw "Image 'aws-for-fluent-bit' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "aws-for-fluent-bit";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-for-fluent-bit";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
