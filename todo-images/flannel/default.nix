{ buildCLIImage, pkgs, lib, ... }:

# Image: flannel
# Reference: https://images.chainguard.dev/directory/image/flannel/overview

# TODO: Implement flannel image
throw "Image 'flannel' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "flannel";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "flannel";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
