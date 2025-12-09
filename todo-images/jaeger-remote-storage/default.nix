{ buildCLIImage, pkgs, lib, ... }:

# Image: jaeger-remote-storage
# Reference: https://images.chainguard.dev/directory/image/jaeger-remote-storage/overview

# Packages NOT in nixpkgs (need custom derivations):
#   jaeger-2-remote-storage (2.13.0-r0)

# TODO: Implement jaeger-remote-storage image
throw "Image 'jaeger-remote-storage' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jaeger-remote-storage";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "jaeger-remote-storage";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
