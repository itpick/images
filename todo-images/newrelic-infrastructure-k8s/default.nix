{ buildCLIImage, pkgs, lib, ... }:

# Image: newrelic-infrastructure-k8s
# Reference: https://images.chainguard.dev/directory/image/newrelic-infrastructure-k8s/overview

# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.fstrm  # fstrm (0.6.1-r3)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.json_c  # json-c (0.18-r4)
#   pkgs.kmod  # kmod (34.2-r42)
#   pkgs.lcms2  # lcms2 (2.17-r5)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libev  # libev (4.33-r9)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpng  # libpng (1.6.53-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libtasn1  # libtasn1 (4.20.0-r5)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.liburcu  # liburcu (0.15.5-r0)
#   pkgs.libuv  # libuv (1.51.0-r2)
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
#   pkgs.nghttp2  # nghttp2 (1.68.0-r0)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.openjdk  # openjdk-8 (8.472.08-r1)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.protobufc  # protobuf-c (1.5.2-r8)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   bind-libs (9.20.16-r0)
#   bind-tools (9.20.16-r0)
#   ca-certificates (20251003-r0)
#   dash-binsh (0.5.13-r2)
#   fontconfig-config (2.17.1-r1)
#   heimdal-libs (7.8.0-r42)
#   java-cacerts (20251003-r0)
#   java-common (0.2-r2)
#   java-common-jre (0.2-r2)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libldap-2.6 (2.6.10-r7)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   newrelic-infrastructure-agent (1.71.1-r0)
#   newrelic-infrastructure-bundle (3.3.6-r1)
#   nghttp2-dev (1.68.0-r0)
#   nri-apache (1.15.3-r1)
#   nri-cassandra (2.16.0-r1)
#   nri-consul (2.9.4-r1)
#   nri-couchbase (2.8.3-r1)
#   nri-discovery-kubernetes (1.13.6-r1)
#   nri-elasticsearch (5.4.5-r1)
#   nri-f5 (2.9.1-r1)
#   nri-haproxy (3.2.3-r1)
#   nri-jmx (3.11.1-r1)
#   nri-kafka (3.15.0-r2)
#   nri-kubernetes (3.50.2-r1)
#   nri-memcached (2.7.3-r1)
#   nri-mongodb (2.10.0-r1)
#   nri-mssql (2.25.1-r1)
#   nri-mysql (1.18.1-r1)
#   nri-nagios (2.11.3-r1)
#   nri-nginx (3.6.3-r1)
#   nri-postgresql (2.22.1-r1)
#   nri-prometheus (2.27.4-r0)
#   nri-rabbitmq (2.15.3-r0)
#   nri-redis (1.12.6-r1)
#   nrjmx (2.10.2-r0)
#   openjdk-17-jre (17.0.17-r2)
#   openjdk-8-default-jdk (8.472.08-r1)
#   p11-kit-trust (0.25.10-r0)
#   sqlite-libs (3.51.1-r0)
#   ttf-dejavu (2.37-r7)

# TODO: Implement newrelic-infrastructure-k8s image
throw "Image 'newrelic-infrastructure-k8s' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.alsa-lib;
#   name = "newrelic-infrastructure-k8s";
#   tag = "v${pkgs.alsa-lib.version}";
#   entrypoint = [ "${pkgs.alsa-lib}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "newrelic-infrastructure-k8s";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
