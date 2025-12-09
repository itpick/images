{ buildCLIImage, pkgs, lib, ... }:

# Image: cilium-agent-fips
# Reference: https://images.chainguard.dev/directory/image/cilium-agent-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.binutils  # binutils (2.45.1-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.clang  # clang-17 (17.0.6-r10)
#   pkgs.gcc  # gcc (15.2.0-r6)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.gops  # gops (0.3.28-r22)
#   pkgs.iproute2  # iproute2 (6.17.0-r2)
#   pkgs.ipset  # ipset (7.24-r2)
#   pkgs.isl  # isl (0.27-r4)
#   pkgs.jq  # jq (1.8.1-r3)
#   pkgs.kmod  # kmod (34.2-r42)
#   pkgs.libbpf  # libbpf (1.6.2-r0)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libelf  # libelf (0.194-r0)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libllvm  # libllvm-17 (17.0.6-r10)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libsmartcols  # libsmartcols (2.41.2-r2)
#   pkgs.libtirpc  # libtirpc (1.3.7-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.linuxheaders  # linux-headers (6.18-r0)
#   pkgs.llvm  # llvm-17 (17.0.6-r10)
#   pkgs.mount  # mount (2.41.2-r2)
#   pkgs.mpc  # mpc (1.3.1-r7)
#   pkgs.mpfr  # mpfr (4.2.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.oniguruma  # oniguruma (6.9.10-r1)
#   pkgs.util-linux  # util-linux (2.41.2-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   boringssl-fips-static-2023042800-tools (2023042800-r6)
#   bpftool (7.6.0-r0)
#   cilium-envoy-fips-1.18 (1.18.4-r0)
#   cilium-fips-1.18 (1.18.4-r2)
#   cilium-fips-1.18-container-init (1.18.4-r2)
#   cilium-fips-1.18-host-utils (1.18.4-r2)
#   cni-plugins-fips-loopback (1.8.0-r3)
#   glibc-dev (2.42-r4)
#   hubble-fips (1.18.3-r3)
#   iptables-wrappers (2-r4)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libatomic (15.2.0-r6)
#   libblkid (2.41.2-r2)
#   libbz2-1 (1.0.8-r21)
#   libclang-cpp-17 (17.0.6-r10)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcrypto3-2.34 (3.6.0-r1)
#   libfdisk (2.41.2-r2)
#   libgomp (15.2.0-r6)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   libquadmath (15.2.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libstdc++-dev (15.2.0-r6)
#   libxcrypt-dev (4.5.2-r0)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nss-db (2.42-r4)
#   nss-hesiod (2.42-r4)
#   openssf-compiler-options (20250904-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   posix-cc-wrappers (2-r7)
#   setarch (2.41.2-r2)
#   sqlite-libs (3.51.1-r0)
#   util-linux-misc (2.41.2-r2)
#   xtables (1.8.11-r29)

# TODO: Implement cilium-agent-fips image
throw "Image 'cilium-agent-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.binutils;
#   name = "cilium-agent-fips";
#   tag = "v${pkgs.binutils.version}";
#   entrypoint = [ "${pkgs.binutils}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cilium-agent-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
