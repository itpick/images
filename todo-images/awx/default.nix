{ buildCLIImage, pkgs, lib, ... }:

# Image: awx
# Reference: https://images.chainguard.dev/directory/image/awx/overview

# TODO: Implement awx image
throw "Image 'awx' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "awx";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "awx";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
