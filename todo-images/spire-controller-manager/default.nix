{ buildCLIImage, pkgs, lib, ... }:

# Image: spire-controller-manager
# Reference: https://images.chainguard.dev/directory/image/spire-controller-manager/overview

# TODO: Implement spire-controller-manager image
throw "Image 'spire-controller-manager' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "spire-controller-manager";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "spire-controller-manager";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
