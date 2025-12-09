{ buildCLIImage, pkgs, lib, ... }:

# Image: cert-exporter
# Reference: https://images.chainguard.dev/directory/image/cert-exporter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cert-exporter (2.17.0-r2)

# TODO: Implement cert-exporter image
throw "Image 'cert-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cert-exporter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cert-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
