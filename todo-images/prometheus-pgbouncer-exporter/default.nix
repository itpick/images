{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-pgbouncer-exporter
# Reference: https://images.chainguard.dev/directory/image/prometheus-pgbouncer-exporter/overview

# Packages available in nixpkgs:
#   pkgs.prometheus-pgbouncer-exporter  # prometheus-pgbouncer-exporter (0.11.0-r2)

# TODO: Implement prometheus-pgbouncer-exporter image
throw "Image 'prometheus-pgbouncer-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-pgbouncer-exporter;
#   name = "prometheus-pgbouncer-exporter";
#   tag = "v${pkgs.prometheus-pgbouncer-exporter.version}";
#   entrypoint = [ "${pkgs.prometheus-pgbouncer-exporter}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65534";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-pgbouncer-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
