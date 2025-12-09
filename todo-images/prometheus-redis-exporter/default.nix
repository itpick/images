{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-redis-exporter
# Reference: https://images.chainguard.dev/directory/image/prometheus-redis-exporter/overview

# Packages available in nixpkgs:
#   pkgs.prometheus-redis-exporter  # prometheus-redis-exporter (1.80.1-r1)

# TODO: Implement prometheus-redis-exporter image
throw "Image 'prometheus-redis-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-redis-exporter;
#   name = "prometheus-redis-exporter";
#   tag = "v${pkgs.prometheus-redis-exporter.version}";
#   entrypoint = [ "${pkgs.prometheus-redis-exporter}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-redis-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
