{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-katib
# Reference: https://images.chainguard.dev/directory/image/kubeflow-katib/overview

# TODO: Implement kubeflow-katib image
throw "Image 'kubeflow-katib' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubeflow-katib";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-katib";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
