{ buildCLIImage, pkgs, lib, ... }:

# Image: cert-manager-webhook-pdns
# Reference: https://images.chainguard.dev/directory/image/cert-manager-webhook-pdns/overview

# TODO: Implement cert-manager-webhook-pdns image
throw "Image 'cert-manager-webhook-pdns' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cert-manager-webhook-pdns";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cert-manager-webhook-pdns";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
