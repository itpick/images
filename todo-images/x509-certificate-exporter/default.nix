{ buildCLIImage, pkgs, lib, ... }:

# Image: x509-certificate-exporter
# Reference: https://images.chainguard.dev/directory/image/x509-certificate-exporter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   x509-certificate-exporter (3.19.1-r7)

# TODO: Implement x509-certificate-exporter image
throw "Image 'x509-certificate-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "x509-certificate-exporter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "x509-certificate-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
