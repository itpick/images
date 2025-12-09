{ buildCLIImage, pkgs, lib, ... }:

# Image: cert-manager-controller-iamguarded-fips
# Reference: https://images.chainguard.dev/directory/image/cert-manager-controller-iamguarded-fips/overview

# TODO: Implement cert-manager-controller-iamguarded-fips image
throw "Image 'cert-manager-controller-iamguarded-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cert-manager-controller-iamguarded-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "cert-manager-controller-iamguarded-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
