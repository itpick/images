{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-katib-db-manager
# Reference: https://images.chainguard.dev/directory/image/kubeflow-katib-db-manager/overview

# TODO: Implement kubeflow-katib-db-manager image
throw "Image 'kubeflow-katib-db-manager' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubeflow-katib-db-manager";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-katib-db-manager";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
