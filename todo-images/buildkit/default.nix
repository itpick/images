{ buildCLIImage, pkgs, lib, ... }:

# Image: buildkit
# Reference: https://images.chainguard.dev/directory/image/buildkit/overview

# TODO: Implement buildkit image
throw "Image 'buildkit' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "buildkit";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "buildkit";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
