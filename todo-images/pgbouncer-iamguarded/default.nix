{ buildCLIImage, pkgs, lib, ... }:

# Image: pgbouncer-iamguarded
# Reference: https://images.chainguard.dev/directory/image/pgbouncer-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libevent  # libevent (2.1.12-r8)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.pgbouncer  # pgbouncer (1.25.0-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ini-file (1.4.9-r3)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   posix-libc-utils (2.42-r4)
#   wait-for-port (1.0.10-r3)

# TODO: Implement pgbouncer-iamguarded image
throw "Image 'pgbouncer-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.c-ares;
#   name = "pgbouncer-iamguarded";
#   tag = "v${pkgs.c-ares.version}";
#   entrypoint = [ "${pkgs.c-ares}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "pgbouncer-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
