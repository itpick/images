{ buildCLIImage, pkgs, lib, ... }:

# Image: vertical-pod-autoscaler-recommender
# Reference: https://images.chainguard.dev/directory/image/vertical-pod-autoscaler-recommender/overview

# Packages NOT in nixpkgs (need custom derivations):
#   vertical-pod-autoscaler-recommender (1.5.1-r2)

# TODO: Implement vertical-pod-autoscaler-recommender image
throw "Image 'vertical-pod-autoscaler-recommender' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "vertical-pod-autoscaler-recommender";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "vertical-pod-autoscaler-recommender";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
