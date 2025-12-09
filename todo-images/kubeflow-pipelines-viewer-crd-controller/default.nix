{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-pipelines-viewer-crd-controller
# Reference: https://images.chainguard.dev/directory/image/kubeflow-pipelines-viewer-crd-controller/overview

# TODO: Implement kubeflow-pipelines-viewer-crd-controller image
throw "Image 'kubeflow-pipelines-viewer-crd-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubeflow-pipelines-viewer-crd-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-pipelines-viewer-crd-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
