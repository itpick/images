{ buildCLIImage, pkgs, lib, ... }:

# Image: debezium-connect
# Reference: https://images.chainguard.dev/directory/image/debezium-connect/overview

# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.iproute2  # iproute2 (6.17.0-r2)
#   pkgs.modern-cpp-kafka  # kafka-4.1 (4.1.1-r0)
#   pkgs.lcms2  # lcms2 (2.17-r5)
#   pkgs.libaio  # libaio (0.3.113-r6)
#   pkgs.libbpf  # libbpf (1.6.2-r0)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libelf  # libelf (0.194-r0)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)
#   pkgs.libpng  # libpng (1.6.52-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libtasn1  # libtasn1 (4.20.0-r5)
#   pkgs.libtirpc  # libtirpc (1.3.7-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
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
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   debezium-3.0 (3.0.8-r7)
#   debezium-3.0-components-all (3.0.8-r7)
#   debezium-3.0-connector-jdbc (3.0.8-r7)
#   debezium-3.0-connector-mariadb (3.0.8-r7)
#   debezium-3.0-connector-mongodb (3.0.8-r7)
#   debezium-3.0-connector-mysql (3.0.8-r7)
#   debezium-3.0-connector-postgres (3.0.8-r7)
#   debezium-3.0-connector-sqlserver (3.0.8-r7)
#   debezium-3.0-connectors-all (3.0.8-r7)
#   debezium-3.0-core (3.0.8-r7)
#   debezium-3.0-scripting (3.0.8-r7)
#   debezium-connect-entrypoint-3.0 (3.0.8-r5)
#   debezium-connector-db2-3.0 (3.0.8-r6)
#   debezium-connector-ibmi-3.0 (3.0.8-r5)
#   debezium-connector-informix-3.0 (3.0.8-r6)
#   debezium-connector-spanner-3.0 (3.0.8-r8)
#   debezium-connector-vitess-3.0 (3.0.8-r8)
#   fontconfig-config (2.17.1-r1)
#   java-cacerts (20251003-r0)
#   java-common-jre (0.2-r2)
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
#   libexpat1 (2.7.3-r0)
#   libfontconfig1 (2.17.1-r1)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openjdk-21-default-jvm (21.0.9-r2)
#   openjdk-21-jre (21.0.9-r2)
#   p11-kit-trust (0.25.10-r0)
#   ttf-dejavu (2.37-r7)
#   xtables (1.8.11-r29)

# TODO: Implement debezium-connect image
throw "Image 'debezium-connect' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.alsa-lib;
#   name = "debezium-connect";
#   tag = "v${pkgs.alsa-lib.version}";
#   entrypoint = [ "${pkgs.alsa-lib}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "debezium-connect";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
