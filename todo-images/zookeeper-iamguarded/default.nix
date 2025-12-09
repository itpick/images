{ buildCLIImage, pkgs, lib, ... }:

# Image: zookeeper-iamguarded
# Reference: https://images.chainguard.dev/directory/image/zookeeper-iamguarded/overview

# TODO: Implement zookeeper-iamguarded image
throw "Image 'zookeeper-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "zookeeper-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "zookeeper-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
