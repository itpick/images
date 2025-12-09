{ buildCLIImage, pkgs, lib, ... }:

# Image: rke2-runtime-airgap
# Reference: https://images.chainguard.dev/directory/image/rke2-runtime-airgap/overview

# Packages available in nixpkgs:
#   pkgs.containerd  # containerd-2 (2.2.0-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.ipset  # ipset (7.24-r2)
#   pkgs.iptables  # iptables (1.8.11-r29)
#   pkgs.kubectl  # kubectl-1.33 (1.33.6-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.0-r0)
#   pkgs.libseccomp  # libseccomp (2.6.0-r1)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.mount  # mount (2.41.2-r2)
#   pkgs.runc  # runc (1.4.0-r0)
#   pkgs.umount  # umount (2.41.2-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   containerd-shim-runc-v2-2 (2.2.0-r3)
#   containerd-stress-2 (2.2.0-r3)
#   crictl (1.34.0-r3)
#   ctr-2 (2.2.0-r3)
#   ip6tables (1.8.11-r29)
#   kubectl-1.33-default (1.33.6-r1)
#   kubelet-1.33 (1.33.6-r1)
#   ld-linux (2.42-r4)
#   libblkid (2.41.2-r2)
#   libcrypto3 (3.6.0-r4)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   rke2-runtime-1.33 (1.33.6.2.1-r2)
#   rke2-runtime-1.33-charts (1.33.6.2.1-r2)
#   xtables (1.8.11-r29)

# TODO: Implement rke2-runtime-airgap image
throw "Image 'rke2-runtime-airgap' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.containerd;
#   name = "rke2-runtime-airgap";
#   tag = "v${pkgs.containerd.version}";
#   entrypoint = [ "${pkgs.containerd}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "rke2-runtime-airgap";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
