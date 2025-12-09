{ buildCLIImage, pkgs, lib, ... }:

# Image: custom-pod-autoscaler-operator
# Reference: https://images.chainguard.dev/directory/image/custom-pod-autoscaler-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   custom-pod-autoscaler-operator (1.4.2-r4)

# TODO: Implement custom-pod-autoscaler-operator image
throw "Image 'custom-pod-autoscaler-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "custom-pod-autoscaler-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "custom-pod-autoscaler-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
