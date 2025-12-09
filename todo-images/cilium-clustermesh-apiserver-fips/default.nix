{ buildCLIImage, pkgs, lib, ... }:

# Image: cilium-clustermesh-apiserver-fips
# Reference: https://images.chainguard.dev/directory/image/cilium-clustermesh-apiserver-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.iputils  # iputils (20250605-r1)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.net-tools  # net-tools (2.10-r31)
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   cilium-fips-1.18-clustermesh-apiserver (1.18.4-r2)
#   etcd-fips-3.6 (3.6.6-r1)
#   gops-fips (0.3.28-r22)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement cilium-clustermesh-apiserver-fips image
throw "Image 'cilium-clustermesh-apiserver-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cilium-clustermesh-apiserver-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cilium-clustermesh-apiserver-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
