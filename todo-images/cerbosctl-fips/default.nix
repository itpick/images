{ buildCLIImage, pkgs, lib, ... }:

# Image: cerbosctl-fips
# Reference: https://images.chainguard.dev/directory/image/cerbosctl-fips/overview

# TODO: Implement cerbosctl-fips image
throw "Image 'cerbosctl-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cerbosctl-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cerbosctl-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
