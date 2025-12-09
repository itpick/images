{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-notebook-controller
# Reference: https://images.chainguard.dev/directory/image/kubeflow-notebook-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubeflow-notebook-controller (1.10.0-r8)

# TODO: Implement kubeflow-notebook-controller image
throw "Image 'kubeflow-notebook-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubeflow-notebook-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-notebook-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
