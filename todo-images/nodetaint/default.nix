{ buildCLIImage, pkgs, lib, ... }:

# Image: nodetaint
# Reference: https://images.chainguard.dev/directory/image/nodetaint/overview

# Packages NOT in nixpkgs (need custom derivations):
#   nodetaint (0.0.4-r39)

# TODO: Implement nodetaint image
throw "Image 'nodetaint' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "nodetaint";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "nodetaint";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
