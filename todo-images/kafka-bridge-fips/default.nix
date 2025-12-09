{ buildCLIImage, pkgs, lib, ... }:

# Image: kafka-bridge-fips
# Reference: https://images.chainguard.dev/directory/image/kafka-bridge-fips/overview

# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.gawk  # gawk (5.3.2-r3)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glibc  # glibc (2.42-r4)
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
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxext  # libxext (1.3.6-r7)
#   pkgs.libxi  # libxi (1.8.2-r4)
#   pkgs.libxrender  # libxrender (0.9.12-r4)
#   pkgs.libxtst  # libxtst (1.2.5-r4)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.wget  # wget (1.25.0-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   bcfips-policy-140-3 (1-r27)
#   bouncycastle-fips (2.1.1-r3)
#   bouncycastle-mail-fips (2.1.6-r2)
#   bouncycastle-pg-fips (2.1.11-r2)
#   bouncycastle-pkix-fips (2.1.9-r2)
#   bouncycastle-rng-jent (1.3.6-r1)
#   bouncycastle-tls-fips (2.1.20-r2)
#   bouncycastle-util-fips (2.1.4-r2)
#   ca-certificates (20251003-r0)
#   dash-binsh (0.5.13-r2)
#   fontconfig-config (2.17.1-r1)
#   java-cacerts (20251003-r0)
#   java-common-jre (0.2-r2)
#   kafka-bridge-fips (0.33.1-r0)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openjdk-17-default-jvm (17.0.17-r2)
#   openjdk-17-jre (17.0.17-r2)
#   openjdk-bcfips-policy-140-3-j17 (1-r27)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   p11-kit-trust (0.25.10-r0)
#   sed (4.9-r6)
#   ttf-dejavu (2.37-r7)

# TODO: Implement kafka-bridge-fips image
throw "Image 'kafka-bridge-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.alsa-lib;
#   name = "kafka-bridge-fips";
#   tag = "v${pkgs.alsa-lib.version}";
#   entrypoint = [ "${pkgs.alsa-lib}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "kafka-bridge-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
