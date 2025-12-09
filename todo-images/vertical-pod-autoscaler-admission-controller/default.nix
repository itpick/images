{ buildCLIImage, pkgs, lib, ... }:

# Image: vertical-pod-autoscaler-admission-controller
# Reference: https://images.chainguard.dev/directory/image/vertical-pod-autoscaler-admission-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   vertical-pod-autoscaler (1.5.1-r2)

# TODO: Implement vertical-pod-autoscaler-admission-controller image
throw "Image 'vertical-pod-autoscaler-admission-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "vertical-pod-autoscaler-admission-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "vertical-pod-autoscaler-admission-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
