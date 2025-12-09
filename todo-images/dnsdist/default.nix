{ buildCLIImage, pkgs, lib, ... }:

# Image: dnsdist
# Reference: https://images.chainguard.dev/directory/image/dnsdist/overview

# Packages available in nixpkgs:
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dnsdist  # dnsdist-2.0 (2.0.2-r0)
#   pkgs.elfutils  # elfutils (0.194-r0)
#   pkgs.fstrm  # fstrm (0.6.1-r3)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.gnutls  # gnutls (3.8.11-r0)
#   pkgs.gtest  # gtest (1.17.0-r3)
#   pkgs.json_c  # json-c (0.18-r4)
#   pkgs.libarchive  # libarchive (3.8.4-r0)
#   pkgs.libbpf  # libbpf (1.6.2-r0)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libelf  # libelf (0.194-r0)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libsodium  # libsodium (1.0.20-r2)
#   pkgs.libtasn1  # libtasn1 (4.20.0-r5)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.lmdb  # lmdb (0.9.31-r5)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nettle  # nettle (3.10.2-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.python  # python-3.12 (3.12.12-r2)
#   pkgs.re2  # re2 (2025.11.05-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   elfutils-dev (0.194-r0)
#   gmock (1.17.0-r3)
#   gmp-dev (6.3.0-r8)
#   heimdal-libs (7.8.0-r42)
#   icu78-data-full (78.1-r0)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libabsl2508.0.0 (20250814.1-r1)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libbpf-dev (1.6.2-r0)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcap-utils (2.77-r0)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libdebuginfod (0.194-r0)
#   libdebuginfod-dev (0.194-r0)
#   libexpat1 (2.7.3-r0)
#   libicu78 (78.1-r0)
#   libldap-2.6 (2.6.10-r7)
#   liblz4-1 (1.10.0-r6)
#   libpcre2-8-0 (10.47-r0)
#   libquiche (0.24.6-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libsystemd (258.2-r3)
#   libxdp (1.5.8-r0)
#   libzstd1 (1.5.7-r5)
#   lua5.4 (5.4.8-r3)
#   lua5.4-libs (5.4.8-r3)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   net-snmp-agent-libs (5.9.4-r41)
#   net-snmp-libs (5.9.4-r41)
#   py3-pip-wheel (25.3-r2)
#   py3.12-jinja2 (3.1.6-r1)
#   py3.12-markupsafe (3.0.3-r0)
#   python-3.12-base (3.12.12-r2)
#   sqlite-libs (3.51.1-r0)
#   xz-dev (5.8.1-r6)
#   zlib-dev (1.3.1-r51)
#   zstd-dev (1.5.7-r5)

# TODO: Implement dnsdist image
throw "Image 'dnsdist' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dnsdist;
#   name = "dnsdist";
#   tag = "v${pkgs.dnsdist.version}";
#   entrypoint = [ "${pkgs.dnsdist}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "953";
#
#   labels = {
#     "org.opencontainers.image.title" = "dnsdist";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
