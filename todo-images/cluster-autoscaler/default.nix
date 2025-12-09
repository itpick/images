{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-autoscaler
# Reference: https://images.chainguard.dev/directory/image/cluster-autoscaler/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cluster-autoscaler-1.34 (1.34.2-r1)

# TODO: Implement cluster-autoscaler image
throw "Image 'cluster-autoscaler' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cluster-autoscaler";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-autoscaler";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
