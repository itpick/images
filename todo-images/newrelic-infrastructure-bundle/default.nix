{ buildCLIImage, pkgs, lib, ... }:

# Image: newrelic-infrastructure-bundle
# Reference: https://images.chainguard.dev/directory/image/newrelic-infrastructure-bundle/overview

# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.kmod  # kmod (34.2-r42)
#   pkgs.lcms2  # lcms2 (2.17-r5)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libpng  # libpng (1.6.52-r0)
#   pkgs.libtasn1  # libtasn1 (4.20.0-r5)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxext  # libxext (1.3.6-r7)
#   pkgs.libxi  # libxi (1.8.2-r4)
#   pkgs.libxrender  # libxrender (0.9.12-r4)
#   pkgs.libxtst  # libxtst (1.2.5-r4)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   fontconfig-config (2.17.1-r1)
#   java-cacerts (20251003-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   newrelic-infrastructure-agent (1.71.1-r0)
#   newrelic-infrastructure-bundle (3.3.6-r1)
#   nri-apache (1.15.3-r0)
#   nri-cassandra (2.16.0-r1)
#   nri-consul (2.9.4-r0)
#   nri-couchbase (2.8.3-r0)
#   nri-discovery-kubernetes (1.13.6-r1)
#   nri-elasticsearch (5.4.5-r1)
#   nri-f5 (2.9.1-r0)
#   nri-haproxy (3.2.3-r0)
#   nri-jmx (3.11.1-r0)
#   nri-kafka (3.15.0-r1)
#   nri-memcached (2.7.3-r1)
#   nri-mssql (2.25.1-r0)
#   nri-mysql (1.18.1-r0)
#   nri-nagios (2.11.3-r0)
#   nri-nginx (3.6.3-r0)
#   nri-postgresql (2.22.1-r1)
#   nri-rabbitmq (2.15.3-r0)
#   nri-redis (1.12.6-r1)
#   nrjmx (2.10.2-r0)
#   openjdk-17-jre (17.0.17-r2)
#   openjdk-8-jre (8.472.08-r1)
#   p11-kit-trust (0.25.10-r0)
#   ttf-dejavu (2.37-r7)

# TODO: Implement newrelic-infrastructure-bundle image
throw "Image 'newrelic-infrastructure-bundle' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.alsa-lib;
#   name = "newrelic-infrastructure-bundle";
#   tag = "v${pkgs.alsa-lib.version}";
#   entrypoint = [ "${pkgs.alsa-lib}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "newrelic-infrastructure-bundle";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
