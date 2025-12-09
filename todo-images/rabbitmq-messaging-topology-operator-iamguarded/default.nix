{ buildCLIImage, pkgs, lib, ... }:

# Image: rabbitmq-messaging-topology-operator-iamguarded
# Reference: https://images.chainguard.dev/directory/image/rabbitmq-messaging-topology-operator-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   rabbitmq-messaging-topology-operator (1.18.1-r1)

# TODO: Implement rabbitmq-messaging-topology-operator-iamguarded image
throw "Image 'rabbitmq-messaging-topology-operator-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.tzdata;
#   name = "rabbitmq-messaging-topology-operator-iamguarded";
#   tag = "v${pkgs.tzdata.version}";
#   entrypoint = [ "${pkgs.tzdata}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "rabbitmq-messaging-topology-operator-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
