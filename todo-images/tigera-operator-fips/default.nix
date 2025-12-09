{ buildCLIImage, pkgs, lib, ... }:

# Image: tigera-operator-fips
# Reference: https://images.chainguard.dev/directory/image/tigera-operator-fips/overview

# TODO: Implement tigera-operator-fips image
throw "Image 'tigera-operator-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "tigera-operator-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tigera-operator-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
