{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-admission-webhook
# Reference: https://images.chainguard.dev/directory/image/kubeflow-admission-webhook/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubeflow-admission-webhook (1.10.0-r8)

# TODO: Implement kubeflow-admission-webhook image
throw "Image 'kubeflow-admission-webhook' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubeflow-admission-webhook";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-admission-webhook";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
