{ buildCLIImage, pkgs, lib, ... }:

# Image: az-fips
# Reference: https://images.chainguard.dev/directory/image/az-fips/overview

# Packages available in nixpkgs:
#   pkgs.az-pim-cli  # az (2.81.0-r0)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   openssl-provider-legacy (3.6.0-r4)
#   py3-pip-wheel (25.3-r2)
#   py3.13-cffi (2.0.0-r0)
#   py3.13-cryptography (46.0.3-r1)
#   py3.13-pycparser (2.23-r0)
#   py3.13-typing-extensions (4.15.0-r0)
#   python-3.13-base (3.13.11-r0)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement az-fips image
throw "Image 'az-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.az-pim-cli;
#   name = "az-fips";
#   tag = "v${pkgs.az-pim-cli.version}";
#   entrypoint = [ "${pkgs.az-pim-cli}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "az-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
