{ buildCLIImage, pkgs, lib, ... }:

# Image: calico-cni
# Reference: https://images.chainguard.dev/directory/image/calico-cni/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   calico-cni-3.31 (3.31.2-r3)
#   cni-plugins-bandwidth (1.8.0-r4)
#   cni-plugins-host-local (1.8.0-r4)
#   cni-plugins-loopback (1.8.0-r4)
#   cni-plugins-portmap (1.8.0-r4)
#   cni-plugins-tuning (1.8.0-r4)
#   flannel-cni-plugin (1.8.0.2-r3)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement calico-cni image
throw "Image 'calico-cni' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "calico-cni";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "calico-cni";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
