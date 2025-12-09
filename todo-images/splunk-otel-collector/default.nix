{ buildCLIImage, pkgs, lib, ... }:

# Image: splunk-otel-collector
# Reference: https://images.chainguard.dev/directory/image/splunk-otel-collector/overview

# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.cryptsetup  # cryptsetup (2.8.1-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dbus  # dbus (1.16.2-r5)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.json_c  # json-c (0.18-r4)
#   pkgs.kmod  # kmod (34.2-r42)
#   pkgs.lcms2  # lcms2 (2.17-r5)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libcap_ng  # libcap-ng (0.8.5-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpng  # libpng (1.6.52-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libseccomp  # libseccomp (2.6.0-r1)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libssh  # libssh (0.11.3-r0)
#   pkgs.libtasn1  # libtasn1 (4.20.0-r5)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
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
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.openjdk  # openjdk-17 (17.0.17-r2)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.popt  # popt (1.19-r3)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.systemd  # systemd (258.2-r3)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   dbus-libs (1.16.2-r5)
#   device-mapper-libs (2.03.37-r0)
#   e2fsprogs-libs (1.47.3-r1)
#   fontconfig-config (2.17.1-r1)
#   heimdal-libs (7.8.0-r42)
#   java-cacerts (20251003-r0)
#   java-common (0.2-r2)
#   java-common-jre (0.2-r2)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libaudit (4.1.2-r1)
#   libblkid (2.41.2-r2)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libfdisk (2.41.2-r2)
#   libfontconfig1 (2.17.1-r1)
#   libldap-2.6 (2.6.10-r7)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libsystemd (258.2-r3)
#   libsystemd-shared (258.2-r3)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openjdk-17-default-jdk (17.0.17-r2)
#   opentelemetry-java-contrib-jmx-metrics (1.52.0-r0)
#   p11-kit-trust (0.25.10-r0)
#   quota-tools (4.10-r1)
#   splunk-otel-collector (0.140.0-r0)
#   sqlite-libs (3.51.1-r0)
#   systemd-boot (258.2-r3)
#   systemd-systemctl (258.2-r3)
#   ttf-dejavu (2.37-r7)

# TODO: Implement splunk-otel-collector image
throw "Image 'splunk-otel-collector' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.alsa-lib;
#   name = "splunk-otel-collector";
#   tag = "v${pkgs.alsa-lib.version}";
#   entrypoint = [ "${pkgs.alsa-lib}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "999";
#
#   labels = {
#     "org.opencontainers.image.title" = "splunk-otel-collector";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
