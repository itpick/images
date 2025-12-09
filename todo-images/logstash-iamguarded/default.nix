{ buildCLIImage, pkgs, lib, ... }:

# Image: logstash-iamguarded
# Reference: https://images.chainguard.dev/directory/image/logstash-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.glibclocales  # glibc-locales (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.lcms2  # lcms2 (2.17-r5)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libpng  # libpng (1.6.53-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libtasn1  # libtasn1 (4.20.0-r5)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxext  # libxext (1.3.6-r7)
#   pkgs.libxi  # libxi (1.8.2-r4)
#   pkgs.libxrender  # libxrender (0.9.12-r4)
#   pkgs.libxtst  # libxtst (1.2.5-r4)
#   pkgs.logstash  # logstash-9.2 (9.2.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.net-tools  # net-tools (2.10-r31)
#   pkgs.openjdk  # openjdk-17 (17.0.17-r2)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.yq  # yq (4.49.2-r1)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   fontconfig-config (2.17.1-r1)
#   java-cacerts (20251003-r0)
#   java-common (0.2-r2)
#   java-common-jre (0.2-r2)
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
#   libpcre2-8-0 (10.47-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openjdk-17-default-jdk (17.0.17-r2)
#   p11-kit-trust (0.25.10-r0)
#   posix-libc-utils (2.42-r4)
#   sed (4.9-r6)
#   ttf-dejavu (2.37-r7)

# TODO: Implement logstash-iamguarded image
throw "Image 'logstash-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.alsa-lib;
#   name = "logstash-iamguarded";
#   tag = "v${pkgs.alsa-lib.version}";
#   entrypoint = [ "${pkgs.alsa-lib}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "logstash-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
