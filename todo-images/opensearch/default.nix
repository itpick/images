{ buildCLIImage, pkgs, lib, ... }:

# Image: opensearch
# Reference: https://images.chainguard.dev/directory/image/opensearch/overview

# TODO: Implement opensearch image
throw "Image 'opensearch' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "opensearch";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "opensearch";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
