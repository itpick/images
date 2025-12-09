{ buildCLIImage, pkgs, lib, ... }:

# Image: asciinema
# Reference: https://images.chainguard.dev/directory/image/asciinema/overview

# TODO: Implement asciinema image
throw "Image 'asciinema' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "asciinema";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "asciinema";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
