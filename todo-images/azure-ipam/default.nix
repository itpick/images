{ buildCLIImage, pkgs, lib, ... }:

# Image: azure-ipam
# Reference: https://images.chainguard.dev/directory/image/azure-ipam/overview

# TODO: Implement azure-ipam image
throw "Image 'azure-ipam' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "azure-ipam";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "azure-ipam";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
