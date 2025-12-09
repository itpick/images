{ buildCLIImage, pkgs, lib, ... }:

# Image: sriov-network-device-plugin
# Reference: https://images.chainguard.dev/directory/image/sriov-network-device-plugin/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   hwdata-pci (0.402-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   sriov-network-device-plugin (3.10.0-r2)
#   sriov-network-device-plugin-entrypoint (3.10.0-r2)

# TODO: Implement sriov-network-device-plugin image
throw "Image 'sriov-network-device-plugin' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "sriov-network-device-plugin";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "sriov-network-device-plugin";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
