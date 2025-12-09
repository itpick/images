{ buildCLIImage, pkgs, lib, ... }:

# Image: imagetest
# Reference: https://images.chainguard.dev/directory/image/imagetest/overview

# TODO: Implement imagetest image
throw "Image 'imagetest' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "imagetest";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "imagetest";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
