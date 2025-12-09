{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-api-vsphere-controller
# Reference: https://images.chainguard.dev/directory/image/cluster-api-vsphere-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cluster-api-provider-vsphere (1.14.0-r3)

# TODO: Implement cluster-api-vsphere-controller image
throw "Image 'cluster-api-vsphere-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cluster-api-vsphere-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-api-vsphere-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
