{ buildCLIImage, pkgs, lib, ... }:

# Image: flyway
# Reference: https://images.chainguard.dev/directory/image/flyway/overview

# TODO: Implement flyway image
throw "Image 'flyway' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "flyway";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "flyway";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
