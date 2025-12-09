{ buildCLIImage, pkgs, lib, ... }:

# Image: cloud-provider-aws
# Reference: https://images.chainguard.dev/directory/image/cloud-provider-aws/overview

# TODO: Implement cloud-provider-aws image
throw "Image 'cloud-provider-aws' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cloud-provider-aws";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cloud-provider-aws";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
