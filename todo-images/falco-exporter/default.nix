{ buildCLIImage, pkgs, lib, ... }:

# Image: falco-exporter
# Reference: https://images.chainguard.dev/directory/image/falco-exporter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   falco-exporter (0.8.7-r11)

# TODO: Implement falco-exporter image
throw "Image 'falco-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "falco-exporter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "falco-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
