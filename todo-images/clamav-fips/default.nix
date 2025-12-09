{ buildCLIImage, pkgs, lib, ... }:

# Image: clamav-fips
# Reference: https://images.chainguard.dev/directory/image/clamav-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.clamav  # clamav-1.5 (1.5.1-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r3)
#   pkgs.json_c  # json-c (0.18-r4)
#   pkgs.libbsd  # libbsd (0.12.2-r3)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libgcc  # libgcc (15.2.0-r3)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libmd  # libmd (1.1.0-r5)
#   pkgs.libmilter  # libmilter (8.18.1-r0)
#   pkgs.libmspack  # libmspack (1.11-r0)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.0-r0)
#   pkgs.libxml2  # libxml2 (2.15.1-r1)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r1)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.netcat-openbsd  # netcat-openbsd (1.234-r0)
#   pkgs.nghttp3  # nghttp3 (1.12.0-r1)
#   pkgs.pcre2  # pcre2 (10.47-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   clamav-1.5-clamdscan (1.5.1-r0)
#   clamav-1.5-daemon (1.5.1-r0)
#   clamav-1.5-db (1.5.1-r0)
#   clamav-1.5-freshclam (1.5.1-r0)
#   clamav-1.5-libunrar (1.5.1-r0)
#   clamav-1.5-milter (1.5.1-r0)
#   clamav-1.5-scanner (1.5.1-r0)
#   clamav-fips-config (1.5.1-r0)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r3)
#   libbrotlicommon1 (1.2.0-r0)
#   libbrotlidec1 (1.2.0-r0)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r3)
#   libcrypto3 (3.6.0-r3)
#   libcurl-openssl4 (8.17.0-r0)
#   libldap-2.6 (2.6.10-r6)
#   libpcre2-16-0 (10.47-r0)
#   libpcre2-32-0 (10.47-r0)
#   libpcre2-8-0 (10.47-r0)
#   libpcre2-posix-3 (10.47-r0)
#   libssl3 (3.6.0-r3)
#   libstdc++ (15.2.0-r3)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r2)
#   openssl-fips-test (0.5-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   sqlite-libs (3.50.4-r2)

# TODO: Implement clamav-fips image
throw "Image 'clamav-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.clamav;
#   name = "clamav-fips";
#   tag = "v${pkgs.clamav.version}";
#   entrypoint = [ "${pkgs.clamav}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "clamav-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
