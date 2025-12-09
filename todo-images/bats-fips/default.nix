{ buildCLIImage, pkgs, lib, ... }:

# Image: bats-fips
# Reference: https://images.chainguard.dev/directory/image/bats-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.parallel  # parallel (20251122-r0)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   bats-assert (2.2.4-r0)
#   bats-core (1.13.0-r0)
#   bats-core-full (1.13.0-r0)
#   bats-detik (1.4.0-r0)
#   bats-file (0.4.0-r0)
#   bats-support (0.3.0-r0)
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement bats-fips image
throw "Image 'bats-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "bats-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "bats-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
