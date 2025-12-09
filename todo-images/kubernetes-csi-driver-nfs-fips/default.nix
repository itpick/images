{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-csi-driver-nfs-fips
# Reference: https://images.chainguard.dev/directory/image/kubernetes-csi-driver-nfs-fips/overview

# TODO: Implement kubernetes-csi-driver-nfs-fips image
throw "Image 'kubernetes-csi-driver-nfs-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-csi-driver-nfs-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-csi-driver-nfs-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
