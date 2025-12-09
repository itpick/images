{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-snmp-exporter
# Reference: https://images.chainguard.dev/directory/image/prometheus-snmp-exporter/overview

# Packages available in nixpkgs:
#   pkgs.prometheus-snmp-exporter  # prometheus-snmp-exporter (0.29.0-r6)

# TODO: Implement prometheus-snmp-exporter image
throw "Image 'prometheus-snmp-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-snmp-exporter;
#   name = "prometheus-snmp-exporter";
#   tag = "v${pkgs.prometheus-snmp-exporter.version}";
#   entrypoint = [ "${pkgs.prometheus-snmp-exporter}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-snmp-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
