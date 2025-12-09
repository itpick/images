{ buildCLIImage, pkgs, lib, ... }:

# Image: test-tmp-client
# Reference: https://images.chainguard.dev/directory/image/test-tmp-client/overview

# TODO: Implement test-tmp-client image
throw "Image 'test-tmp-client' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "test-tmp-client";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "test-tmp-client";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
