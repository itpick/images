{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-tensorboard-controller
# Reference: https://images.chainguard.dev/directory/image/kubeflow-tensorboard-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubeflow-tensorboard-controller (1.10.0-r8)

# TODO: Implement kubeflow-tensorboard-controller image
throw "Image 'kubeflow-tensorboard-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubeflow-tensorboard-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-tensorboard-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
