{ buildCLIImage, pkgs, lib, ... }:

# Image: backing-image-manager
# Reference: https://images.chainguard.dev/directory/image/backing-image-manager/overview

# TODO: Implement backing-image-manager image
throw "Image 'backing-image-manager' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "backing-image-manager";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "backing-image-manager";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
