{ buildCLIImage, pkgs, lib, ... }:

# Image: rancher-webhook
# Reference: https://images.chainguard.dev/directory/image/rancher-webhook/overview

# Packages NOT in nixpkgs (need custom derivations):
#   rancher-webhook-0.6 (0.6.11-r3)

# TODO: Implement rancher-webhook image
throw "Image 'rancher-webhook' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "rancher-webhook";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "rancher-webhook";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
