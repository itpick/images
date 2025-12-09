{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-api-kubeadm-bootstrap-controller
# Reference: https://images.chainguard.dev/directory/image/cluster-api-kubeadm-bootstrap-controller/overview

# TODO: Implement cluster-api-kubeadm-bootstrap-controller image
throw "Image 'cluster-api-kubeadm-bootstrap-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cluster-api-kubeadm-bootstrap-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-api-kubeadm-bootstrap-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
