{ buildCLIImage, pkgs, lib, ... }:

# Image: apko
# Reference: https://images.chainguard.dev/directory/image/apko/overview

# TODO: Implement apko image
throw "Image 'apko' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "apko";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "apko";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
