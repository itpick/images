{ buildCLIImage, pkgs, lib, ... }:

# Image: cert-manager-webhook-fips
# Reference: https://images.chainguard.dev/directory/image/cert-manager-webhook-fips/overview

# TODO: Implement cert-manager-webhook-fips image
throw "Image 'cert-manager-webhook-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cert-manager-webhook-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cert-manager-webhook-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
