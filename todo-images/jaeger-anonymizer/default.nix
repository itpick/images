{ buildCLIImage, pkgs, lib, ... }:

# Image: jaeger-anonymizer
# Reference: https://images.chainguard.dev/directory/image/jaeger-anonymizer/overview

# Packages NOT in nixpkgs (need custom derivations):
#   jaeger-2-anonymizer (2.13.0-r0)

# TODO: Implement jaeger-anonymizer image
throw "Image 'jaeger-anonymizer' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jaeger-anonymizer";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "jaeger-anonymizer";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
