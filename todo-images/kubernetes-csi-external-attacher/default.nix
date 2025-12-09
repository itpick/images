{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-csi-external-attacher
# Reference: https://images.chainguard.dev/directory/image/kubernetes-csi-external-attacher/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-csi-external-attacher (4.10.0-r3)

# TODO: Implement kubernetes-csi-external-attacher image
throw "Image 'kubernetes-csi-external-attacher' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-csi-external-attacher";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-csi-external-attacher";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
