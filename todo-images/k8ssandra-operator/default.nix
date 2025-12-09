{ buildCLIImage, pkgs, lib, ... }:

# Image: k8ssandra-operator
# Reference: https://images.chainguard.dev/directory/image/k8ssandra-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   k8ssandra-operator (1.29.0-r2)

# TODO: Implement k8ssandra-operator image
throw "Image 'k8ssandra-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "k8ssandra-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "k8ssandra-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
