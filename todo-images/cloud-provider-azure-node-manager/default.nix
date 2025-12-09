{ buildCLIImage, pkgs, lib, ... }:

# Image: cloud-provider-azure-node-manager
# Reference: https://images.chainguard.dev/directory/image/cloud-provider-azure-node-manager/overview

# TODO: Implement cloud-provider-azure-node-manager image
throw "Image 'cloud-provider-azure-node-manager' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cloud-provider-azure-node-manager";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cloud-provider-azure-node-manager";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
