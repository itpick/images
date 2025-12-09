{ buildCLIImage, pkgs, lib, ... }:

# Image: descheduler
# Reference: https://images.chainguard.dev/directory/image/descheduler/overview

# Packages NOT in nixpkgs (need custom derivations):
#   descheduler (0.34.0-r2)

# TODO: Implement descheduler image
throw "Image 'descheduler' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "descheduler";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "descheduler";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
