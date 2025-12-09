{ buildCLIImage, pkgs, lib, ... }:

# Image: grafana-alloy-operator
# Reference: https://images.chainguard.dev/directory/image/grafana-alloy-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   grafana-alloy-operator (0.3.14-r0)
#   helm-operator (1.42.0-r2)

# TODO: Implement grafana-alloy-operator image
throw "Image 'grafana-alloy-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "grafana-alloy-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "grafana-alloy-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
