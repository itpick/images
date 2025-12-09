{ buildCLIImage, pkgs, lib, ... }:

# Image: frr
# Reference: https://images.chainguard.dev/directory/image/frr/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.frr  # frr-10.4 (10.4.1-r2)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.iproute2  # iproute2 (6.17.0-r2)
#   pkgs.json_c  # json-c (0.18-r4)
#   pkgs.libbpf  # libbpf (1.6.2-r0)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libelf  # libelf (0.194-r0)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libssh  # libssh (0.11.3-r0)
#   pkgs.libtirpc  # libtirpc (1.3.7-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libyang  # libyang (3.13.6-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.protobufc  # protobuf-c (1.5.2-r8)
#   pkgs.python  # python-3.11 (3.11.14-r3)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.rtrlib  # rtrlib (0.8.0-r2)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libpcre2-8-0 (10.47-r0)
#   libpcre2-posix-3 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   lua5.3-libs (5.3.6-r11)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   py3-pip-wheel (25.3-r2)
#   py3-setuptools-wheel (80.9.0-r3)
#   python-3.11-base (3.11.14-r3)
#   sqlite-libs (3.51.1-r0)
#   xtables (1.8.11-r29)

# TODO: Implement frr image
throw "Image 'frr' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.frr;
#   name = "frr";
#   tag = "v${pkgs.frr.version}";
#   entrypoint = [ "${pkgs.frr}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "frr";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
