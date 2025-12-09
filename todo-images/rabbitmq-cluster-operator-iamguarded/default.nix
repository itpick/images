{ buildCLIImage, pkgs, lib, ... }:

# Image: rabbitmq-cluster-operator-iamguarded
# Reference: https://images.chainguard.dev/directory/image/rabbitmq-cluster-operator-iamguarded/overview

# Packages NOT in nixpkgs (need custom derivations):
#   rabbitmq-cluster-operator (2.17.2-r2)

# TODO: Implement rabbitmq-cluster-operator-iamguarded image
throw "Image 'rabbitmq-cluster-operator-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "rabbitmq-cluster-operator-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "rabbitmq-cluster-operator-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
