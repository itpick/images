{ buildCLIImage, pkgs, lib, ... }:

# Image: postgres-iamguarded-fips
# Reference: https://images.chainguard.dev/directory/image/postgres-iamguarded-fips/overview

# TODO: Implement postgres-iamguarded-fips image
throw "Image 'postgres-iamguarded-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "postgres-iamguarded-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "postgres-iamguarded-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
