{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-csi-node-driver-registrar
# Reference: https://images.chainguard.dev/directory/image/kubernetes-csi-node-driver-registrar/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-csi-node-driver-registrar-2.15 (2.15.0-r2)

# TODO: Implement kubernetes-csi-node-driver-registrar image
throw "Image 'kubernetes-csi-node-driver-registrar' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-csi-node-driver-registrar";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-csi-node-driver-registrar";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
