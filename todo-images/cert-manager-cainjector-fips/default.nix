{ buildCLIImage, pkgs, lib, ... }:

# Image: cert-manager-cainjector-fips
# Reference: https://images.chainguard.dev/directory/image/cert-manager-cainjector-fips/overview

# TODO: Implement cert-manager-cainjector-fips image
throw "Image 'cert-manager-cainjector-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cert-manager-cainjector-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cert-manager-cainjector-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
