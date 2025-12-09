{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-event-exporter
# Reference: https://images.chainguard.dev/directory/image/kubernetes-event-exporter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-event-exporter (1.7-r48)

# TODO: Implement kubernetes-event-exporter image
throw "Image 'kubernetes-event-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-event-exporter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-event-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
