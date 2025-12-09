{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-kube-scheduler
# Reference: https://images.chainguard.dev/directory/image/kubernetes-kube-scheduler/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kube-scheduler-1.34 (1.34.2-r3)
#   kube-scheduler-1.34-default (1.34.2-r3)
#   kubernetes-release-go-runner (0.18.0-r5)

# TODO: Implement kubernetes-kube-scheduler image
throw "Image 'kubernetes-kube-scheduler' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-kube-scheduler";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-kube-scheduler";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
