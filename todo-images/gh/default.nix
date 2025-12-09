{ buildCLIImage, pkgs, lib, ... }:

# Image: gh
# Reference: https://images.chainguard.dev/directory/image/gh/overview

# TODO: Implement gh image
throw "Image 'gh' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "gh";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "gh";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
