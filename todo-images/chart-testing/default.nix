{ buildCLIImage, pkgs, lib, ... }:

# Image: chart-testing
# Reference: https://images.chainguard.dev/directory/image/chart-testing/overview

# TODO: Implement chart-testing image
throw "Image 'chart-testing' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "chart-testing";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "chart-testing";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
