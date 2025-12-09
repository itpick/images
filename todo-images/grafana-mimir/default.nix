{ buildCLIImage, pkgs, lib, ... }:

# Image: grafana-mimir
# Reference: https://images.chainguard.dev/directory/image/grafana-mimir/overview

# Packages NOT in nixpkgs (need custom derivations):
#   grafana-mimir (3.0.1-r1)

# TODO: Implement grafana-mimir image
throw "Image 'grafana-mimir' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "grafana-mimir";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "grafana-mimir";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
