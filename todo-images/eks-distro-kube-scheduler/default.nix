{ buildCLIImage, pkgs, lib, ... }:

# Image: eks-distro-kube-scheduler
# Reference: https://images.chainguard.dev/directory/image/eks-distro-kube-scheduler/overview

# Packages NOT in nixpkgs (need custom derivations):
#   eks-distro-kube-scheduler-1.34 (1.34.11-r0)

# TODO: Implement eks-distro-kube-scheduler image
throw "Image 'eks-distro-kube-scheduler' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "eks-distro-kube-scheduler";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "eks-distro-kube-scheduler";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
