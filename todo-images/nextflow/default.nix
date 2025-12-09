{ buildCLIImage, pkgs, lib, ... }:

# Image: nextflow
# Reference: https://images.chainguard.dev/directory/image/nextflow/overview

# TODO: Implement nextflow image
throw "Image 'nextflow' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "nextflow";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "nextflow";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
