{ buildCLIImage, pkgs, lib, ... }:

# Image: flannel-cni-plugin
# Reference: https://images.chainguard.dev/directory/image/flannel-cni-plugin/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   flannel-cni-plugin (1.8.0.2-r3)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement flannel-cni-plugin image
throw "Image 'flannel-cni-plugin' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "flannel-cni-plugin";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "flannel-cni-plugin";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
