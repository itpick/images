{ buildCLIImage, pkgs, lib, ... }:

# Image: grafana-operator
# Reference: https://images.chainguard.dev/directory/image/grafana-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   grafana-operator (5.20.0-r3)

# TODO: Implement grafana-operator image
throw "Image 'grafana-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "grafana-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "grafana-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
