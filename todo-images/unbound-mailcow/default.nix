{ buildCLIImage, pkgs, lib, ... }:

# Image: unbound-mailcow
# Reference: https://images.chainguard.dev/directory/image/unbound-mailcow/overview

# TODO: Implement unbound-mailcow image
throw "Image 'unbound-mailcow' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "unbound-mailcow";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "unbound-mailcow";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
