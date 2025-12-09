{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-access-management
# Reference: https://images.chainguard.dev/directory/image/kubeflow-access-management/overview

# TODO: Implement kubeflow-access-management image
throw "Image 'kubeflow-access-management' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubeflow-access-management";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-access-management";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
