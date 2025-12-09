{ buildCLIImage, pkgs, lib, ... }:

# Image: grafana-rollout-operator
# Reference: https://images.chainguard.dev/directory/image/grafana-rollout-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   grafana-rollout-operator (0.32.0-r2)

# TODO: Implement grafana-rollout-operator image
throw "Image 'grafana-rollout-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "grafana-rollout-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "grafana-rollout-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
