{ buildCLIImage, pkgs, lib, ... }:

# Image: kumactl
# Reference: https://images.chainguard.dev/directory/image/kumactl/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.iptables  # iptables (1.8.11-r29)
#   pkgs.kumactl  # kumactl-2.9 (2.9.10-r2)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   xtables (1.8.11-r29)

# TODO: Implement kumactl image
throw "Image 'kumactl' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.kumactl;
#   name = "kumactl";
#   tag = "v${pkgs.kumactl.version}";
#   entrypoint = [ "${pkgs.kumactl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kumactl";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
