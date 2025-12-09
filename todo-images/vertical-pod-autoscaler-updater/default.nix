{ buildCLIImage, pkgs, lib, ... }:

# Image: vertical-pod-autoscaler-updater
# Reference: https://images.chainguard.dev/directory/image/vertical-pod-autoscaler-updater/overview

# Packages NOT in nixpkgs (need custom derivations):
#   vertical-pod-autoscaler-updater (1.5.1-r2)

# TODO: Implement vertical-pod-autoscaler-updater image
throw "Image 'vertical-pod-autoscaler-updater' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "vertical-pod-autoscaler-updater";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "vertical-pod-autoscaler-updater";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
