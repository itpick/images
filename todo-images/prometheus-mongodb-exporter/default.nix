{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-mongodb-exporter
# Reference: https://images.chainguard.dev/directory/image/prometheus-mongodb-exporter/overview

# Packages available in nixpkgs:
#   pkgs.prometheus-mongodb-exporter  # prometheus-mongodb-exporter (0.47.2-r0)

# TODO: Implement prometheus-mongodb-exporter image
throw "Image 'prometheus-mongodb-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-mongodb-exporter;
#   name = "prometheus-mongodb-exporter";
#   tag = "v${pkgs.prometheus-mongodb-exporter.version}";
#   entrypoint = [ "${pkgs.prometheus-mongodb-exporter}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-mongodb-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
