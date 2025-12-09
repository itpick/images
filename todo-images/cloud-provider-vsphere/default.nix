{ buildCLIImage, pkgs, lib, ... }:

# Image: cloud-provider-vsphere
# Reference: https://images.chainguard.dev/directory/image/cloud-provider-vsphere/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cloud-provider-vsphere (1.34.0-r4)

# TODO: Implement cloud-provider-vsphere image
throw "Image 'cloud-provider-vsphere' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cloud-provider-vsphere";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cloud-provider-vsphere";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
