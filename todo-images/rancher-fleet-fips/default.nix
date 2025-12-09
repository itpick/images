{ buildCLIImage, pkgs, lib, ... }:

# Image: rancher-fleet-fips
# Reference: https://images.chainguard.dev/directory/image/rancher-fleet-fips/overview

# TODO: Implement rancher-fleet-fips image
throw "Image 'rancher-fleet-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "rancher-fleet-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "rancher-fleet-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
