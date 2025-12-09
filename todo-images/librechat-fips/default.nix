{ buildCLIImage, pkgs, lib, ... }:

# Image: librechat-fips
# Reference: https://images.chainguard.dev/directory/image/librechat-fips/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.jemalloc  # jemalloc (5.3.0-r6)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nodejs  # nodejs-20 (20.19.6-r0)
#   pkgs.npm-check  # npm (11.6.4-r0)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.python  # python-3.13 (3.13.11-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.uv  # uv (0.9.16-r0)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yarn  # yarn (1.22.22-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libicu78 (78.1-r0)
#   libjemalloc2 (5.3.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   py3-pip-wheel (25.3-r2)
#   py3.13-pip (25.3-r2)
#   py3.13-pip-base (25.3-r2)
#   py3.13-setuptools (80.9.0-r4)
#   python-3.13-base (3.13.11-r0)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement librechat-fips image
throw "Image 'librechat-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.c-ares;
#   name = "librechat-fips";
#   tag = "v${pkgs.c-ares.version}";
#   entrypoint = [ "${pkgs.c-ares}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "librechat-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
