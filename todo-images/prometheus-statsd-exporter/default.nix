{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-statsd-exporter
# Reference: https://images.chainguard.dev/directory/image/prometheus-statsd-exporter/overview

# Packages available in nixpkgs:
#   pkgs.prometheus-statsd-exporter  # prometheus-statsd-exporter (0.28.0-r16)

# TODO: Implement prometheus-statsd-exporter image
throw "Image 'prometheus-statsd-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-statsd-exporter;
#   name = "prometheus-statsd-exporter";
#   tag = "v${pkgs.prometheus-statsd-exporter.version}";
#   entrypoint = [ "${pkgs.prometheus-statsd-exporter}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-statsd-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
