{ buildCLIImage, pkgs, lib, ... }:

# Image: calico-cni-fips
# Reference: https://images.chainguard.dev/directory/image/calico-cni-fips/overview

# TODO: Implement calico-cni-fips image
throw "Image 'calico-cni-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "calico-cni-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "calico-cni-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
