{ buildCLIImage, pkgs, lib, ... }:

# Image: glibc
# Reference: https://images.chainguard.dev/directory/image/glibc/overview

# TODO: Implement glibc image
throw "Image 'glibc' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "glibc";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "glibc";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
