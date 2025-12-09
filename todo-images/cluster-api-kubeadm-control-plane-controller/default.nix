{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-api-kubeadm-control-plane-controller
# Reference: https://images.chainguard.dev/directory/image/cluster-api-kubeadm-control-plane-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cluster-api-1.9-kubeadm-control-plane-controller (1.9.11-r4)

# TODO: Implement cluster-api-kubeadm-control-plane-controller image
throw "Image 'cluster-api-kubeadm-control-plane-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cluster-api-kubeadm-control-plane-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-api-kubeadm-control-plane-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
