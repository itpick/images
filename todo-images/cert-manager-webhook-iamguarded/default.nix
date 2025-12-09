{ buildCLIImage, pkgs, lib, ... }:

# Image: cert-manager-webhook-iamguarded
# Reference: https://images.chainguard.dev/directory/image/cert-manager-webhook-iamguarded/overview

# TODO: Implement cert-manager-webhook-iamguarded image
throw "Image 'cert-manager-webhook-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cert-manager-webhook-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "cert-manager-webhook-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
