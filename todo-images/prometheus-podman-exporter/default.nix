{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-podman-exporter
# Reference: https://images.chainguard.dev/directory/image/prometheus-podman-exporter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   prometheus-podman-exporter (1.19.0-r5)

# TODO: Implement prometheus-podman-exporter image
throw "Image 'prometheus-podman-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "prometheus-podman-exporter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-podman-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
