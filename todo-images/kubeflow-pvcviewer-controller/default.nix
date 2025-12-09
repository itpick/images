{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-pvcviewer-controller
# Reference: https://images.chainguard.dev/directory/image/kubeflow-pvcviewer-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubeflow-pvcviewer-controller (1.10.0-r8)

# TODO: Implement kubeflow-pvcviewer-controller image
throw "Image 'kubeflow-pvcviewer-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubeflow-pvcviewer-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-pvcviewer-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
