{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-blackbox-exporter
# Reference: https://images.chainguard.dev/directory/image/prometheus-blackbox-exporter/overview

# Packages available in nixpkgs:
#   pkgs.prometheus-blackbox-exporter  # prometheus-blackbox-exporter (0.28.0-r0)

# TODO: Implement prometheus-blackbox-exporter image
throw "Image 'prometheus-blackbox-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-blackbox-exporter;
#   name = "prometheus-blackbox-exporter";
#   tag = "v${pkgs.prometheus-blackbox-exporter.version}";
#   entrypoint = [ "${pkgs.prometheus-blackbox-exporter}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-blackbox-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
