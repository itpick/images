{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-alertmanager
# Reference: https://images.chainguard.dev/directory/image/prometheus-alertmanager/overview

# Packages available in nixpkgs:
#   pkgs.prometheus-alertmanager  # prometheus-alertmanager (0.29.0-r2)

# TODO: Implement prometheus-alertmanager image
throw "Image 'prometheus-alertmanager' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-alertmanager;
#   name = "prometheus-alertmanager";
#   tag = "v${pkgs.prometheus-alertmanager.version}";
#   entrypoint = [ "${pkgs.prometheus-alertmanager}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-alertmanager";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
