{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-csi-external-resizer
# Reference: https://images.chainguard.dev/directory/image/kubernetes-csi-external-resizer/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-csi-external-resizer (2.0.0-r1)

# TODO: Implement kubernetes-csi-external-resizer image
throw "Image 'kubernetes-csi-external-resizer' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-csi-external-resizer";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-csi-external-resizer";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
