{ buildCLIImage, pkgs, lib, ... }:

# Image: authentik
# Reference: https://images.chainguard.dev/directory/image/authentik/overview

# TODO: Implement authentik image
throw "Image 'authentik' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "authentik";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "authentik";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
