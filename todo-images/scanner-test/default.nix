{ buildCLIImage, pkgs, lib, ... }:

# Image: scanner-test
# Reference: https://images.chainguard.dev/directory/image/scanner-test/overview

# TODO: Implement scanner-test image
throw "Image 'scanner-test' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "scanner-test";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "scanner-test";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
