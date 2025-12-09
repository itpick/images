{ buildCLIImage, pkgs, lib, ... }:

# Image: k8s-agents-operator
# Reference: https://images.chainguard.dev/directory/image/k8s-agents-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   k8s-agents-operator (0.32.3-r1)

# TODO: Implement k8s-agents-operator image
throw "Image 'k8s-agents-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "k8s-agents-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "k8s-agents-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
