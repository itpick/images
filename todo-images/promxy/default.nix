{ buildCLIImage, pkgs, lib, ... }:

# Image: promxy
# Reference: https://images.chainguard.dev/directory/image/promxy/overview

# Packages NOT in nixpkgs (need custom derivations):
#   promxy (0.0.93-r5)

# TODO: Implement promxy image
throw "Image 'promxy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "promxy";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "promxy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
