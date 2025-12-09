{ buildCLIImage, pkgs, lib, ... }:

# Image: rabbitmq-cluster-operator
# Reference: https://images.chainguard.dev/directory/image/rabbitmq-cluster-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   rabbitmq-cluster-operator (2.17.2-r2)

# TODO: Implement rabbitmq-cluster-operator image
throw "Image 'rabbitmq-cluster-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "rabbitmq-cluster-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "rabbitmq-cluster-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
