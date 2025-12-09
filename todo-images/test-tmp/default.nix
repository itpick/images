{ buildCLIImage, pkgs, lib, ... }:

# Image: test-tmp
# Reference: https://images.chainguard.dev/directory/image/test-tmp/overview

# TODO: Implement test-tmp image
throw "Image 'test-tmp' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "test-tmp";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "test-tmp";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
