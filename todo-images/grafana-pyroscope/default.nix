{ buildCLIImage, pkgs, lib, ... }:

# Image: grafana-pyroscope
# Reference: https://images.chainguard.dev/directory/image/grafana-pyroscope/overview

# Packages NOT in nixpkgs (need custom derivations):
#   grafana-pyroscope-1.13 (1.13.6-r3)

# TODO: Implement grafana-pyroscope image
throw "Image 'grafana-pyroscope' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "grafana-pyroscope";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "grafana-pyroscope";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
