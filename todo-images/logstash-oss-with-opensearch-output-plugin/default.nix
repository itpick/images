{ buildCLIImage, pkgs, lib, ... }:

# Image: logstash-oss-with-opensearch-output-plugin
# Reference: https://images.chainguard.dev/directory/image/logstash-oss-with-opensearch-output-plugin/overview

# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.lcms2  # lcms2 (2.17-r5)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libpng  # libpng (1.6.53-r0)
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
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openjdk  # openjdk-21 (21.0.9-r2)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   fontconfig-config (2.17.1-r1)
#   java-cacerts (20251003-r0)
#   java-common (0.2-r2)
#   java-common-jre (0.2-r2)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   logstash-8.19-env2yaml (8.19.8-r0)
#   logstash-8.19-with-output-opensearch (8.19.8-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openjdk-21-default-jdk (21.0.9-r2)
#   p11-kit-trust (0.25.10-r0)
#   ttf-dejavu (2.37-r7)

# TODO: Implement logstash-oss-with-opensearch-output-plugin image
throw "Image 'logstash-oss-with-opensearch-output-plugin' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.alsa-lib;
#   name = "logstash-oss-with-opensearch-output-plugin";
#   tag = "v${pkgs.alsa-lib.version}";
#   entrypoint = [ "${pkgs.alsa-lib}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "logstash-oss-with-opensearch-output-plugin";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
