{ buildCLIImage, pkgs, lib, ... }:

# Image: nginx-prometheus-exporter
# Reference: https://images.chainguard.dev/directory/image/nginx-prometheus-exporter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   nginx-prometheus-exporter (1.5.1-r2)

# TODO: Implement nginx-prometheus-exporter image
throw "Image 'nginx-prometheus-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "nginx-prometheus-exporter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "nginx-prometheus-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
