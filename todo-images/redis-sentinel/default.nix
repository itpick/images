{ buildCLIImage, pkgs, lib, ... }:

# Image: redis-sentinel
# Reference: https://images.chainguard.dev/directory/image/redis-sentinel/overview

# TODO: Implement redis-sentinel image
throw "Image 'redis-sentinel' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "redis-sentinel";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "redis-sentinel";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
