{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-pushgateway-iamguarded
# Reference: https://images.chainguard.dev/directory/image/prometheus-pushgateway-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.prometheus-pushgateway  # prometheus-pushgateway (1.11.2-r2)
#   pkgs.tzdata  # tzdata (2025b-r2)

# TODO: Implement prometheus-pushgateway-iamguarded image
throw "Image 'prometheus-pushgateway-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-pushgateway;
#   name = "prometheus-pushgateway-iamguarded";
#   tag = "v${pkgs.prometheus-pushgateway.version}";
#   entrypoint = [ "${pkgs.prometheus-pushgateway}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-pushgateway-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
