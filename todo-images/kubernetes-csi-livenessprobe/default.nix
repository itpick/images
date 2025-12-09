{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-csi-livenessprobe
# Reference: https://images.chainguard.dev/directory/image/kubernetes-csi-livenessprobe/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-csi-livenessprobe (2.17.0-r2)

# TODO: Implement kubernetes-csi-livenessprobe image
throw "Image 'kubernetes-csi-livenessprobe' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-csi-livenessprobe";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-csi-livenessprobe";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
