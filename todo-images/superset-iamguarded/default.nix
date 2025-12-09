{ buildCLIImage, pkgs, lib, ... }:

# Image: superset-iamguarded
# Reference: https://images.chainguard.dev/directory/image/superset-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cairo  # cairo (1.18.4-r1)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.hwloc  # hwloc (2.12.2-r1)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libpng  # libpng (1.6.52-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libudev-zero  # libudev (258.2-r3)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxext  # libxext (1.3.6-r7)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.libxrender  # libxrender (0.9.12-r4)
#   pkgs.linuxheaders  # linux-headers (6.18-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.pixman  # pixman (0.46.4-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ecpg-18 (18.1-r0)
#   fontconfig-config (2.17.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libgomp (15.2.0-r6)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libtbb (2022.3.0-r0)
#   libtbb-dev (2022.3.0-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   posix-libc-utils (2.42-r4)
#   py3-pip-wheel (25.3-r2)
#   py3-setuptools-wheel (80.9.0-r3)
#   py3.11-pip (25.3-r2)
#   py3.11-pip-base (25.3-r2)
#   py3.11-setuptools (80.9.0-r4)
#   python-3.11-base (3.11.14-r3)
#   sqlite-libs (3.51.1-r0)
#   superset-5.0 (5.0.0-r8)
#   superset-5.0-entrypoint (5.0.0-r8)

# TODO: Implement superset-iamguarded image
throw "Image 'superset-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cairo;
#   name = "superset-iamguarded";
#   tag = "v${pkgs.cairo.version}";
#   entrypoint = [ "${pkgs.cairo}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "superset-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
