{ buildCLIImage, pkgs, lib, ... }:

# Image: redpanda
# Reference: https://images.chainguard.dev/directory/image/redpanda/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.e2fsprogs  # e2fsprogs (1.47.3-r1)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libaio  # libaio (0.3.113-r6)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.numactl  # numactl (2.0.19-r2)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.redpanda  # redpanda-25.2 (25.2.12-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   e2fsprogs-libs (1.47.3-r1)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libblkid (2.41.2-r2)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libldap-2.6 (2.6.10-r7)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   rpk-25.2.12 (25.2.12-r0)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement redpanda image
throw "Image 'redpanda' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.redpanda;
#   name = "redpanda";
#   tag = "v${pkgs.redpanda.version}";
#   entrypoint = [ "${pkgs.redpanda}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "redpanda";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
