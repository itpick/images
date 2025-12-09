{ buildCLIImage, pkgs, lib, ... }:

# Image: kafka-exporter
# Reference: https://images.chainguard.dev/directory/image/kafka-exporter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kafka_exporter (1.9.0-r41)

# TODO: Implement kafka-exporter image
throw "Image 'kafka-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kafka-exporter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kafka-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
