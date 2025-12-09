{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-csi-external-provisioner
# Reference: https://images.chainguard.dev/directory/image/kubernetes-csi-external-provisioner/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-csi-external-provisioner (6.1.0-r2)

# TODO: Implement kubernetes-csi-external-provisioner image
throw "Image 'kubernetes-csi-external-provisioner' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-csi-external-provisioner";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-csi-external-provisioner";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
