{ buildCLIImage, pkgs, lib, ... }:

# Image: cadvisor-fips
# Reference: https://images.chainguard.dev/directory/image/cadvisor-fips/overview

# TODO: Implement cadvisor-fips image
throw "Image 'cadvisor-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cadvisor-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "cadvisor-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
