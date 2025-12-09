{ buildCLIImage, pkgs, lib, ... }:

# Image: vc-controller-manager
# Reference: https://images.chainguard.dev/directory/image/vc-controller-manager/overview

# TODO: Implement vc-controller-manager image
throw "Image 'vc-controller-manager' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "vc-controller-manager";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "vc-controller-manager";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
