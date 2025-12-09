{ buildCLIImage, pkgs, lib, ... }:

# Image: rabbitmq-fips
# Reference: https://images.chainguard.dev/directory/image/rabbitmq-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   erlang-fips-27 (27.3.4.6-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   posix-libc-utils (2.42-r4)
#   rabbitmq-server-fips (4.2.1-r0)

# TODO: Implement rabbitmq-fips image
throw "Image 'rabbitmq-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "rabbitmq-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "999";
#
#   labels = {
#     "org.opencontainers.image.title" = "rabbitmq-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
