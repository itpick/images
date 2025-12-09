{ buildCLIImage, pkgs, lib, ... }:

# Image: jaeger-ingester
# Reference: https://images.chainguard.dev/directory/image/jaeger-ingester/overview

# Packages NOT in nixpkgs (need custom derivations):
#   jaeger-2-ingester (2.13.0-r0)

# TODO: Implement jaeger-ingester image
throw "Image 'jaeger-ingester' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jaeger-ingester";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "jaeger-ingester";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
