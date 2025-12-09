{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-pushgateway
# Reference: https://images.chainguard.dev/directory/image/prometheus-pushgateway/overview

# Packages available in nixpkgs:
#   pkgs.prometheus-pushgateway  # prometheus-pushgateway (1.11.2-r2)

# TODO: Implement prometheus-pushgateway image
throw "Image 'prometheus-pushgateway' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-pushgateway;
#   name = "prometheus-pushgateway";
#   tag = "v${pkgs.prometheus-pushgateway.version}";
#   entrypoint = [ "${pkgs.prometheus-pushgateway}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65534";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-pushgateway";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
