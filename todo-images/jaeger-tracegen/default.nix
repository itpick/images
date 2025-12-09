{ buildCLIImage, pkgs, lib, ... }:

# Image: jaeger-tracegen
# Reference: https://images.chainguard.dev/directory/image/jaeger-tracegen/overview

# Packages NOT in nixpkgs (need custom derivations):
#   jaeger-2-tracegen (2.13.0-r0)

# TODO: Implement jaeger-tracegen image
throw "Image 'jaeger-tracegen' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jaeger-tracegen";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "jaeger-tracegen";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
