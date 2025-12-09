{ buildCLIImage, pkgs, lib, ... }:

# Image: volcano
# Reference: https://images.chainguard.dev/directory/image/volcano/overview

# TODO: Implement volcano image
throw "Image 'volcano' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "volcano";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "volcano";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
