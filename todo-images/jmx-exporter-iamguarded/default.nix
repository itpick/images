{ buildCLIImage, pkgs, lib, ... }:

# Image: jmx-exporter-iamguarded
# Reference: https://images.chainguard.dev/directory/image/jmx-exporter-iamguarded/overview

# TODO: Implement jmx-exporter-iamguarded image
throw "Image 'jmx-exporter-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jmx-exporter-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "jmx-exporter-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
