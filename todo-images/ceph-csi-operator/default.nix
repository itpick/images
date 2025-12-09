{ buildCLIImage, pkgs, lib, ... }:

# Image: ceph-csi-operator
# Reference: https://images.chainguard.dev/directory/image/ceph-csi-operator/overview

# TODO: Implement ceph-csi-operator image
throw "Image 'ceph-csi-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "ceph-csi-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ceph-csi-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
