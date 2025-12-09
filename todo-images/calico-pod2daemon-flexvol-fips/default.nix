{ buildCLIImage, pkgs, lib, ... }:

# Image: calico-pod2daemon-flexvol-fips
# Reference: https://images.chainguard.dev/directory/image/calico-pod2daemon-flexvol-fips/overview

# TODO: Implement calico-pod2daemon-flexvol-fips image
throw "Image 'calico-pod2daemon-flexvol-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "calico-pod2daemon-flexvol-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "calico-pod2daemon-flexvol-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
