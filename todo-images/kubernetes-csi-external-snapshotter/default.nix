{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-csi-external-snapshotter
# Reference: https://images.chainguard.dev/directory/image/kubernetes-csi-external-snapshotter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-csi-external-snapshotter-8.4 (8.4.0-r1)

# TODO: Implement kubernetes-csi-external-snapshotter image
throw "Image 'kubernetes-csi-external-snapshotter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-csi-external-snapshotter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-csi-external-snapshotter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
