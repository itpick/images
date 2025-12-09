{ buildCLIImage, pkgs, lib, ... }:

# Image: eks-distro-kube-controller-manager
# Reference: https://images.chainguard.dev/directory/image/eks-distro-kube-controller-manager/overview

# TODO: Implement eks-distro-kube-controller-manager image
throw "Image 'eks-distro-kube-controller-manager' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "eks-distro-kube-controller-manager";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "eks-distro-kube-controller-manager";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
