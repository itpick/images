{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-cli-iamguarded
# Reference: https://images.chainguard.dev/directory/image/aws-cli-iamguarded/overview

# TODO: Implement aws-cli-iamguarded image
throw "Image 'aws-cli-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "aws-cli-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-cli-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
