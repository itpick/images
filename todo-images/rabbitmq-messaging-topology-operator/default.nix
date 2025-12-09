{ buildCLIImage, pkgs, lib, ... }:

# Image: rabbitmq-messaging-topology-operator
# Reference: https://images.chainguard.dev/directory/image/rabbitmq-messaging-topology-operator/overview

# Packages available in nixpkgs:
#   pkgs.tzdata  # tzdata (2025b-r2)

# TODO: Implement rabbitmq-messaging-topology-operator image
throw "Image 'rabbitmq-messaging-topology-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.tzdata;
#   name = "rabbitmq-messaging-topology-operator";
#   tag = "v${pkgs.tzdata.version}";
#   entrypoint = [ "${pkgs.tzdata}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "rabbitmq-messaging-topology-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
