{ buildCLIImage, pkgs, lib, ... }:

# Image: pulumi
# Reference: https://images.chainguard.dev/directory/image/pulumi/overview

# TODO: Implement pulumi image
throw "Image 'pulumi' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "pulumi";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "pulumi";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
