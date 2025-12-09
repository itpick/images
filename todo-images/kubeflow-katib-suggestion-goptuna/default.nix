{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-katib-suggestion-goptuna
# Reference: https://images.chainguard.dev/directory/image/kubeflow-katib-suggestion-goptuna/overview

# Packages NOT in nixpkgs (need custom derivations):
#   katib-suggestion-goptuna (0.19.0-r2)

# TODO: Implement kubeflow-katib-suggestion-goptuna image
throw "Image 'kubeflow-katib-suggestion-goptuna' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubeflow-katib-suggestion-goptuna";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-katib-suggestion-goptuna";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
