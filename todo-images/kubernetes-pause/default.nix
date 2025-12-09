{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-pause
# Reference: https://images.chainguard.dev/directory/image/kubernetes-pause/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-pause-1.34 (1.34.2-r3)

# TODO: Implement kubernetes-pause image
throw "Image 'kubernetes-pause' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-pause";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-pause";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
