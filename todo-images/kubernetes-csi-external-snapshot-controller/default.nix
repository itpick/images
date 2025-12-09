{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-csi-external-snapshot-controller
# Reference: https://images.chainguard.dev/directory/image/kubernetes-csi-external-snapshot-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-csi-external-snapshot-controller-8.4 (8.4.0-r1)

# TODO: Implement kubernetes-csi-external-snapshot-controller image
throw "Image 'kubernetes-csi-external-snapshot-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-csi-external-snapshot-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-csi-external-snapshot-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
