{ buildCLIImage, pkgs, lib, ... }:

# Image: mesosphere-vsphere-csi-syncer
# Reference: https://images.chainguard.dev/directory/image/mesosphere-vsphere-csi-syncer/overview

# Packages NOT in nixpkgs (need custom derivations):
#   mesosphere-vsphere-csi (3.5.0-r4)
#   mesosphere-vsphere-csi-syncer (3.5.0-r4)

# TODO: Implement mesosphere-vsphere-csi-syncer image
throw "Image 'mesosphere-vsphere-csi-syncer' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "mesosphere-vsphere-csi-syncer";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "mesosphere-vsphere-csi-syncer";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
