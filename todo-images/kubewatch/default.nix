{ buildCLIImage, pkgs, lib, ... }:

# Image: kubewatch
# Reference: https://images.chainguard.dev/directory/image/kubewatch/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubewatch (2.12.0-r1)

# TODO: Implement kubewatch image
throw "Image 'kubewatch' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubewatch";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubewatch";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
