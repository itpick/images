{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-alertmanager-iamguarded
# Reference: https://images.chainguard.dev/directory/image/prometheus-alertmanager-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.prometheus-alertmanager  # prometheus-alertmanager (0.29.0-r2)

# TODO: Implement prometheus-alertmanager-iamguarded image
throw "Image 'prometheus-alertmanager-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-alertmanager;
#   name = "prometheus-alertmanager-iamguarded";
#   tag = "v${pkgs.prometheus-alertmanager.version}";
#   entrypoint = [ "${pkgs.prometheus-alertmanager}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-alertmanager-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
