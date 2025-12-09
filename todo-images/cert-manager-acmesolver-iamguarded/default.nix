{ buildCLIImage, pkgs, lib, ... }:

# Image: cert-manager-acmesolver-iamguarded
# Reference: https://images.chainguard.dev/directory/image/cert-manager-acmesolver-iamguarded/overview

# TODO: Implement cert-manager-acmesolver-iamguarded image
throw "Image 'cert-manager-acmesolver-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cert-manager-acmesolver-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "cert-manager-acmesolver-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
