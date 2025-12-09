{ buildCLIImage, pkgs, lib, ... }:

# Image: confluent-kafka
# Reference: https://images.chainguard.dev/directory/image/confluent-kafka/overview

# TODO: Implement confluent-kafka image
throw "Image 'confluent-kafka' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "confluent-kafka";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "confluent-kafka";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
