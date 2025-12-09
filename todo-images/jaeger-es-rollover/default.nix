{ buildCLIImage, pkgs, lib, ... }:

# Image: jaeger-es-rollover
# Reference: https://images.chainguard.dev/directory/image/jaeger-es-rollover/overview

# Packages NOT in nixpkgs (need custom derivations):
#   jaeger-2-es-rollover (2.13.0-r0)

# TODO: Implement jaeger-es-rollover image
throw "Image 'jaeger-es-rollover' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jaeger-es-rollover";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "jaeger-es-rollover";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
