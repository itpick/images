{ buildCLIImage, pkgs, lib, ... }:

# Image: flink
# Reference: https://images.chainguard.dev/directory/image/flink/overview

# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.flink  # flink-2.1 (2.1.1-r0)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.gettext  # gettext (0.26-r1)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gosu  # gosu (1.19-r2)
#   pkgs.lcms2  # lcms2 (2.17-r5)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libpng  # libpng (1.6.53-r0)
#   pkgs.libtasn1  # libtasn1 (4.20.0-r5)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxext  # libxext (1.3.6-r7)
#   pkgs.libxi  # libxi (1.8.2-r4)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.libxrender  # libxrender (0.9.12-r4)
#   pkgs.libxtst  # libxtst (1.2.5-r4)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   fontconfig-config (2.17.1-r1)
#   glibc-iconv (2.42-r4)
#   java-cacerts (20251003-r0)
#   java-common-jre (0.2-r2)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libgomp (15.2.0-r6)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openjdk-17-default-jvm (17.0.17-r2)
#   openjdk-17-jre (17.0.17-r2)
#   p11-kit-trust (0.25.10-r0)
#   ttf-dejavu (2.37-r7)

# TODO: Implement flink image
throw "Image 'flink' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.flink;
#   name = "flink";
#   tag = "v${pkgs.flink.version}";
#   entrypoint = [ "${pkgs.flink}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "flink";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
