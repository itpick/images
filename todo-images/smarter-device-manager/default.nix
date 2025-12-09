{ buildCLIImage, pkgs, lib, ... }:

# Image: smarter-device-manager
# Reference: https://images.chainguard.dev/directory/image/smarter-device-manager/overview

# TODO: Implement smarter-device-manager image
throw "Image 'smarter-device-manager' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "smarter-device-manager";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "smarter-device-manager";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
