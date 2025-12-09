{ buildCLIImage, pkgs, lib, ... }:

# Image: opensearch-k8s-operator
# Reference: https://images.chainguard.dev/directory/image/opensearch-k8s-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   opensearch-k8s-operator (2.8.0-r4)

# TODO: Implement opensearch-k8s-operator image
throw "Image 'opensearch-k8s-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "opensearch-k8s-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "opensearch-k8s-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
