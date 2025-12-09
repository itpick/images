{ buildCLIImage, pkgs, lib, ... }:

# Image: thanos-iamguarded-client
# Reference: https://images.chainguard.dev/directory/image/thanos-iamguarded-client/overview

# TODO: Implement thanos-iamguarded-client image
throw "Image 'thanos-iamguarded-client' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "thanos-iamguarded-client";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "thanos-iamguarded-client";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
