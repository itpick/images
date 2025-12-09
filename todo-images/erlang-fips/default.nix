{ buildCLIImage, pkgs, lib, ... }:

# Image: erlang-fips
# Reference: https://images.chainguard.dev/directory/image/erlang-fips/overview

# TODO: Implement erlang-fips image
throw "Image 'erlang-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "erlang-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "erlang-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
