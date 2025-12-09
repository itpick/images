{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-profile-controller
# Reference: https://images.chainguard.dev/directory/image/kubeflow-profile-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubeflow-profile-controller (1.10.0-r8)

# TODO: Implement kubeflow-profile-controller image
throw "Image 'kubeflow-profile-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubeflow-profile-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-profile-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
