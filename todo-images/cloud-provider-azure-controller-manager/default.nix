{ buildCLIImage, pkgs, lib, ... }:

# Image: cloud-provider-azure-controller-manager
# Reference: https://images.chainguard.dev/directory/image/cloud-provider-azure-controller-manager/overview

# TODO: Implement cloud-provider-azure-controller-manager image
throw "Image 'cloud-provider-azure-controller-manager' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cloud-provider-azure-controller-manager";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cloud-provider-azure-controller-manager";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
