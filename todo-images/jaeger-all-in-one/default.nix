{ buildCLIImage, pkgs, lib, ... }:

# Image: jaeger-all-in-one
# Reference: https://images.chainguard.dev/directory/image/jaeger-all-in-one/overview

# Packages NOT in nixpkgs (need custom derivations):
#   jaeger-2-all-in-one (2.13.0-r0)

# TODO: Implement jaeger-all-in-one image
throw "Image 'jaeger-all-in-one' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jaeger-all-in-one";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "jaeger-all-in-one";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
