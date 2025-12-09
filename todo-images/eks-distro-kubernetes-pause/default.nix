{ buildCLIImage, pkgs, lib, ... }:

# Image: eks-distro-kubernetes-pause
# Reference: https://images.chainguard.dev/directory/image/eks-distro-kubernetes-pause/overview

# Packages NOT in nixpkgs (need custom derivations):
#   eks-distro-kubernetes-pause-1.34 (1.34.11-r0)

# TODO: Implement eks-distro-kubernetes-pause image
throw "Image 'eks-distro-kubernetes-pause' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "eks-distro-kubernetes-pause";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "eks-distro-kubernetes-pause";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
