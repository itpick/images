{ buildCLIImage, pkgs, lib, ... }:

# Image: mdbook
# Reference: https://images.chainguard.dev/directory/image/mdbook/overview

# TODO: Implement mdbook image
throw "Image 'mdbook' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "mdbook";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "mdbook";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
