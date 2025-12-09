{ buildCLIImage, pkgs, lib, ... }:

# Image: nvidia-gpu-driver
# Reference: https://images.chainguard.dev/directory/image/nvidia-gpu-driver/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.binutils  # binutils (2.45.1-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.elfutils  # elfutils (0.194-r0)
#   pkgs.file  # file (5.46-r4)
#   pkgs.gcc  # gcc (15.2.0-r6)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.isl  # isl (0.27-r4)
#   pkgs.json_c  # json-c (0.18-r4)
#   pkgs.kmod  # kmod (34.2-r42)
#   pkgs.libarchive  # libarchive (3.8.4-r0)
#   pkgs.libelf  # libelf (0.194-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libglvnd  # libglvnd (1.7.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.linuxheaders  # linux-headers (6.18-r0)
#   pkgs.fzf-make  # make (4.4.1-r8)
#   pkgs.mpc  # mpc (1.3.1-r7)
#   pkgs.mpfr  # mpfr (4.2.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.pkgconf  # pkgconf (2.5.1-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   build-base (1-r9)
#   elfutils-dev (0.194-r0)
#   glibc-dev (2.42-r4)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libatomic (15.2.0-r6)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libdebuginfod (0.194-r0)
#   libdebuginfod-dev (0.194-r0)
#   libexpat1 (2.7.3-r0)
#   libglvnd-dev (1.7.0-r6)
#   libgomp (15.2.0-r6)
#   libldap-2.6 (2.6.10-r7)
#   liblz4-1 (1.10.0-r6)
#   libmagic (5.46-r4)
#   libquadmath (15.2.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libstdc++-dev (15.2.0-r6)
#   libxcrypt-dev (4.5.2-r0)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nss-db (2.42-r4)
#   nss-hesiod (2.42-r4)
#   nvidia-display-driver (550.54.14-r1)
#   nvidia-gpu-driver (550.54.14-r1)
#   nvidia-libnvidia-nscq (550.54.14-r2)
#   openssf-compiler-options (20250904-r1)
#   pkgconf-dev (2.5.1-r1)
#   posix-cc-wrappers (2-r7)
#   sqlite-libs (3.51.1-r0)
#   vgpu-util (25.01.21-r7)
#   xz-dev (5.8.1-r6)
#   zlib-dev (1.3.1-r51)
#   zstd-dev (1.5.7-r5)

# TODO: Implement nvidia-gpu-driver image
throw "Image 'nvidia-gpu-driver' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.binutils;
#   name = "nvidia-gpu-driver";
#   tag = "v${pkgs.binutils.version}";
#   entrypoint = [ "${pkgs.binutils}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "nvidia-gpu-driver";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
