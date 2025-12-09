{ buildCLIImage, pkgs, lib, ... }:

# Image: redis-iamguarded-fips
# Reference: https://images.chainguard.dev/directory/image/redis-iamguarded-fips/overview

# TODO: Implement redis-iamguarded-fips image
throw "Image 'redis-iamguarded-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "redis-iamguarded-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "redis-iamguarded-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
