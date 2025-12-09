{ buildCLIImage, pkgs, lib, ... }:

# Image: timestamp-authority
# Reference: https://images.chainguard.dev/directory/image/timestamp-authority/overview

# TODO: Implement timestamp-authority image
throw "Image 'timestamp-authority' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "timestamp-authority";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "timestamp-authority";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
