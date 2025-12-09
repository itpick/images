{ buildCLIImage, pkgs, lib, ... }:

# Image: jaeger-es-index-cleaner
# Reference: https://images.chainguard.dev/directory/image/jaeger-es-index-cleaner/overview

# Packages NOT in nixpkgs (need custom derivations):
#   jaeger-2-es-index-cleaner (2.13.0-r0)

# TODO: Implement jaeger-es-index-cleaner image
throw "Image 'jaeger-es-index-cleaner' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jaeger-es-index-cleaner";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "jaeger-es-index-cleaner";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
