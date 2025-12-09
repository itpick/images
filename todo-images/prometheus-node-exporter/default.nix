{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-node-exporter
# Reference: https://images.chainguard.dev/directory/image/prometheus-node-exporter/overview

# Packages available in nixpkgs:
#   pkgs.prometheus-node-exporter  # prometheus-node-exporter (1.10.2-r3)

# TODO: Implement prometheus-node-exporter image
throw "Image 'prometheus-node-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-node-exporter;
#   name = "prometheus-node-exporter";
#   tag = "v${pkgs.prometheus-node-exporter.version}";
#   entrypoint = [ "${pkgs.prometheus-node-exporter}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-node-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
