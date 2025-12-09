{ buildCLIImage, pkgs, lib, ... }:

# Image: neuvector-manager-fips
# Reference: https://images.chainguard.dev/directory/image/neuvector-manager-fips/overview

# TODO: Implement neuvector-manager-fips image
throw "Image 'neuvector-manager-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "neuvector-manager-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "neuvector-manager-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
