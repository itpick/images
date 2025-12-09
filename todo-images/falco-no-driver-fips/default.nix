{ buildCLIImage, pkgs, lib, ... }:

# Image: falco-no-driver-fips
# Reference: https://images.chainguard.dev/directory/image/falco-no-driver-fips/overview

# Packages available in nixpkgs:
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.grpc  # grpc-1.66 (1.66.2-r17)
#   pkgs.gtest  # gtest (1.17.0-r3)
#   pkgs.libbpf  # libbpf (1.6.2-r0)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libelf  # libelf (0.194-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.re2  # re2 (2025.11.05-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yaml-cpp  # yaml-cpp (0.8.0-r10)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   falco-no-driver (0.42.1-r0)
#   falco-plugin-container (0.42.1-r0)
#   falco-rules (5.0.0-r0)
#   gmock (1.17.0-r3)
#   heimdal-libs (7.8.0-r42)
#   icu78-data-full (78.1-r0)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libabsl2501.0.0 (20250127.1-r6)
#   libabsl2508.0.0 (20250814.1-r1)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libicu78 (78.1-r0)
#   libldap-2.6 (2.6.10-r7)
#   libprotobuf29.5.0 (29.5-r0)
#   libprotoc29.5.0 (29.5-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libsystemd (258.2-r3)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement falco-no-driver-fips image
throw "Image 'falco-no-driver-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.c-ares;
#   name = "falco-no-driver-fips";
#   tag = "v${pkgs.c-ares.version}";
#   entrypoint = [ "${pkgs.c-ares}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "falco-no-driver-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
