{ buildCLIImage, pkgs, lib, ... }:

# Image: dbgate
# Reference: https://images.chainguard.dev/directory/image/dbgate/overview

# TODO: Implement dbgate image
throw "Image 'dbgate' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "dbgate";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "dbgate";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
