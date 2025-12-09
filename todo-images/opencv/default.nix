{ buildCLIImage, pkgs, lib, ... }:

# Image: opencv
# Reference: https://images.chainguard.dev/directory/image/opencv/overview

# TODO: Implement opencv image
throw "Image 'opencv' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "opencv";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "opencv";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
