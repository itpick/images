{ buildCLIImage, pkgs, lib, ... }:

# Image: jaeger-collector
# Reference: https://images.chainguard.dev/directory/image/jaeger-collector/overview

# Packages NOT in nixpkgs (need custom derivations):
#   jaeger-2-collector (2.12.0-r1)

# TODO: Implement jaeger-collector image
throw "Image 'jaeger-collector' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jaeger-collector";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "jaeger-collector";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
