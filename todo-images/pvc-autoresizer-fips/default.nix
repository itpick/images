{ buildCLIImage, pkgs, lib, ... }:

# Image: pvc-autoresizer-fips
# Reference: https://images.chainguard.dev/directory/image/pvc-autoresizer-fips/overview

# TODO: Implement pvc-autoresizer-fips image
throw "Image 'pvc-autoresizer-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "pvc-autoresizer-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "10000";
#
#   labels = {
#     "org.opencontainers.image.title" = "pvc-autoresizer-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
