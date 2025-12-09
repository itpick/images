{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-dashboard-auth
# Reference: https://images.chainguard.dev/directory/image/kubernetes-dashboard-auth/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-dashboard-auth (1.4.0-r0)

# TODO: Implement kubernetes-dashboard-auth image
throw "Image 'kubernetes-dashboard-auth' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-dashboard-auth";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-dashboard-auth";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
