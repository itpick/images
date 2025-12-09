{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-process-exporter
# Reference: https://images.chainguard.dev/directory/image/prometheus-process-exporter/overview

# Packages available in nixpkgs:
#   pkgs.prometheus-process-exporter  # prometheus-process-exporter (0.8.7-r5)

# TODO: Implement prometheus-process-exporter image
throw "Image 'prometheus-process-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-process-exporter;
#   name = "prometheus-process-exporter";
#   tag = "v${pkgs.prometheus-process-exporter.version}";
#   entrypoint = [ "${pkgs.prometheus-process-exporter}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-process-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
