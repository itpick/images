{ buildCLIImage, pkgs, lib, ... }:

# Image: helm-operator
# Reference: https://images.chainguard.dev/directory/image/helm-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   helm-operator (1.42.0-r3)

# TODO: Implement helm-operator image
throw "Image 'helm-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "helm-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "helm-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
