{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-blackbox-exporter-iamguarded
# Reference: https://images.chainguard.dev/directory/image/prometheus-blackbox-exporter-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.prometheus-blackbox-exporter  # prometheus-blackbox-exporter (0.28.0-r0)

# TODO: Implement prometheus-blackbox-exporter-iamguarded image
throw "Image 'prometheus-blackbox-exporter-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-blackbox-exporter;
#   name = "prometheus-blackbox-exporter-iamguarded";
#   tag = "v${pkgs.prometheus-blackbox-exporter.version}";
#   entrypoint = [ "${pkgs.prometheus-blackbox-exporter}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-blackbox-exporter-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
