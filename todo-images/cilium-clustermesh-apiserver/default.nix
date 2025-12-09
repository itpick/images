{ buildCLIImage, pkgs, lib, ... }:

# Image: cilium-clustermesh-apiserver
# Reference: https://images.chainguard.dev/directory/image/cilium-clustermesh-apiserver/overview

# Packages available in nixpkgs:
#   pkgs.etcd  # etcd-3.6 (3.6.6-r2)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gops  # gops (0.3.28-r22)
#   pkgs.iputils  # iputils (20250605-r1)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.net-tools  # net-tools (2.10-r31)
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   cilium-1.18-clustermesh-apiserver (1.18.4-r2)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement cilium-clustermesh-apiserver image
throw "Image 'cilium-clustermesh-apiserver' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.etcd;
#   name = "cilium-clustermesh-apiserver";
#   tag = "v${pkgs.etcd.version}";
#   entrypoint = [ "${pkgs.etcd}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cilium-clustermesh-apiserver";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
