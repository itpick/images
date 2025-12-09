{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-proportional-autoscaler
# Reference: https://images.chainguard.dev/directory/image/cluster-proportional-autoscaler/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cluster-proportional-autoscaler (1.10.2-r8)

# TODO: Implement cluster-proportional-autoscaler image
throw "Image 'cluster-proportional-autoscaler' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cluster-proportional-autoscaler";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-proportional-autoscaler";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
