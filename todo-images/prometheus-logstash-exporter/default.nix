{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-logstash-exporter
# Reference: https://images.chainguard.dev/directory/image/prometheus-logstash-exporter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   logstash-exporter (1.9.1-r3)

# TODO: Implement prometheus-logstash-exporter image
throw "Image 'prometheus-logstash-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "prometheus-logstash-exporter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-logstash-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
