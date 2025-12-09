{ buildCLIImage, pkgs, lib, ... }:

# Image: strimzi-kafka
# Reference: https://images.chainguard.dev/directory/image/strimzi-kafka/overview

# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.gawk  # gawk (5.3.2-r3)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.gettext  # gettext (0.26-r1)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.modern-cpp-kafka  # kafka-4.1 (4.1.1-r0)
#   pkgs.lcms2  # lcms2 (2.17-r5)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpng  # libpng (1.6.52-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libtasn1  # libtasn1 (4.20.0-r5)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
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
#   pkgs.net-tools  # net-tools (2.10-r31)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.nmap  # nmap (7.98-r0)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   bash-binsh (5.3-r3)
#   ca-certificates (20251003-r0)
#   fontconfig-config (2.17.1-r1)
#   glibc-iconv (2.42-r4)
#   heimdal-libs (7.8.0-r42)
#   java-cacerts (20251003-r0)
#   java-common-jre (0.2-r2)
#   kafka_exporter (1.9.0-r41)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libgomp (15.2.0-r6)
#   libldap-2.6 (2.6.10-r7)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openjdk-21-default-jvm (21.0.9-r2)
#   openjdk-21-jre (21.0.9-r2)
#   p11-kit-trust (0.25.10-r0)
#   prometheus-jmx-exporter (1.5.0-r0)
#   sed (4.9-r6)
#   sqlite-libs (3.51.1-r0)
#   strimzi-kafka-operator-kafka-agent (0.49.0-r0)
#   strimzi-kafka-operator-kafka-base (0.49.0-r0)
#   strimzi-kafka-operator-kafka-thirdparty-libs (0.49.0-r0)
#   strimzi-kafka-operator-kafka-thirdparty-libs-cc (0.49.0-r0)
#   strimzi-kafka-operator-topic-operator (0.49.0-r0)
#   ttf-dejavu (2.37-r7)

# TODO: Implement strimzi-kafka image
throw "Image 'strimzi-kafka' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.alsa-lib;
#   name = "strimzi-kafka";
#   tag = "v${pkgs.alsa-lib.version}";
#   entrypoint = [ "${pkgs.alsa-lib}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "strimzi-kafka";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
