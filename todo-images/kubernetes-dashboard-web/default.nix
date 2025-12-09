{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-dashboard-web
# Reference: https://images.chainguard.dev/directory/image/kubernetes-dashboard-web/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-dashboard-web (1.7.0-r7)

# TODO: Implement kubernetes-dashboard-web image
throw "Image 'kubernetes-dashboard-web' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-dashboard-web";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-dashboard-web";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
