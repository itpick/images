{ buildCLIImage, pkgs, lib, ... }:

# Image: clickhouse-operator-metrics-exporter
# Reference: https://images.chainguard.dev/directory/image/clickhouse-operator-metrics-exporter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   clickhouse-operator-metrics-exporter (0.25.5-r1)

# TODO: Implement clickhouse-operator-metrics-exporter image
throw "Image 'clickhouse-operator-metrics-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "clickhouse-operator-metrics-exporter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65534";
#
#   labels = {
#     "org.opencontainers.image.title" = "clickhouse-operator-metrics-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
