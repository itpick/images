{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-cloudwatchlogs
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-cloudwatchlogs/overview

# TODO: Implement crossplane-aws-cloudwatchlogs image
throw "Image 'crossplane-aws-cloudwatchlogs' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-cloudwatchlogs";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-cloudwatchlogs";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
