{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-katib-controller
# Reference: https://images.chainguard.dev/directory/image/kubeflow-katib-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   katib-controller (0.19.0-r2)

# TODO: Implement kubeflow-katib-controller image
throw "Image 'kubeflow-katib-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubeflow-katib-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-katib-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
