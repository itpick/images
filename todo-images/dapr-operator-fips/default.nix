{ buildCLIImage, pkgs, lib, ... }:

# Image: dapr-operator-fips
# Reference: https://images.chainguard.dev/directory/image/dapr-operator-fips/overview

# TODO: Implement dapr-operator-fips image
throw "Image 'dapr-operator-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "dapr-operator-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "dapr-operator-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
