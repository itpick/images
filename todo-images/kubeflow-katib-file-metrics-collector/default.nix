{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-katib-file-metrics-collector
# Reference: https://images.chainguard.dev/directory/image/kubeflow-katib-file-metrics-collector/overview

# Packages NOT in nixpkgs (need custom derivations):
#   katib-file-metricscollector (0.19.0-r2)

# TODO: Implement kubeflow-katib-file-metrics-collector image
throw "Image 'kubeflow-katib-file-metrics-collector' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubeflow-katib-file-metrics-collector";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-katib-file-metrics-collector";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
