{ buildCLIImage, pkgs, lib, ... }:

# Image: jaeger-query
# Reference: https://images.chainguard.dev/directory/image/jaeger-query/overview

# Packages NOT in nixpkgs (need custom derivations):
#   jaeger-2-query (2.13.0-r0)

# TODO: Implement jaeger-query image
throw "Image 'jaeger-query' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jaeger-query";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "jaeger-query";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
