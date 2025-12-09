{ buildCLIImage, pkgs, lib, ... }:

# Image: kuberay-operator
# Reference: https://images.chainguard.dev/directory/image/kuberay-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kuberay-operator (1.5.1-r0)

# TODO: Implement kuberay-operator image
throw "Image 'kuberay-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kuberay-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kuberay-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
