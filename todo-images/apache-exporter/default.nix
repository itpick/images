{ buildCLIImage, pkgs, lib, ... }:

# Image: apache-exporter
# Reference: https://images.chainguard.dev/directory/image/apache-exporter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   apache-exporter (1.0.11-r2)

# TODO: Implement apache-exporter image
throw "Image 'apache-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "apache-exporter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "apache-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
