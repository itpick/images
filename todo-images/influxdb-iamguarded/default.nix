{ buildCLIImage, pkgs, lib, ... }:

# Image: influxdb-iamguarded
# Reference: https://images.chainguard.dev/directory/image/influxdb-iamguarded/overview

# TODO: Implement influxdb-iamguarded image
throw "Image 'influxdb-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "influxdb-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "influxdb-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
