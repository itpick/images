{ buildCLIImage, pkgs, lib, ... }:

# Image: helm-chartmuseum
# Reference: https://images.chainguard.dev/directory/image/helm-chartmuseum/overview

# Packages NOT in nixpkgs (need custom derivations):
#   chartmuseum (0.16.3-r11)

# TODO: Implement helm-chartmuseum image
throw "Image 'helm-chartmuseum' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "helm-chartmuseum";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "helm-chartmuseum";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
