{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-postgres-exporter-iamguarded
# Reference: https://images.chainguard.dev/directory/image/prometheus-postgres-exporter-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.prometheus-postgres-exporter  # prometheus-postgres-exporter (0.18.1-r5)

# TODO: Implement prometheus-postgres-exporter-iamguarded image
throw "Image 'prometheus-postgres-exporter-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-postgres-exporter;
#   name = "prometheus-postgres-exporter-iamguarded";
#   tag = "v${pkgs.prometheus-postgres-exporter.version}";
#   entrypoint = [ "${pkgs.prometheus-postgres-exporter}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-postgres-exporter-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
