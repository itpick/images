{ buildCLIImage, pkgs, lib, ... }:

# Image: redis-iamguarded
# Reference: https://images.chainguard.dev/directory/image/redis-iamguarded/overview

# TODO: Implement redis-iamguarded image
throw "Image 'redis-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "redis-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "redis-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
