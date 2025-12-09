{ buildCLIImage, pkgs, lib, ... }:

# Image: harbor-redis
# Reference: https://images.chainguard.dev/directory/image/harbor-redis/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.redis  # redis-7.2 (7.2.12-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   posix-libc-utils (2.42-r4)
#   redis-cli-7.2 (7.2.12-r0)

# TODO: Implement harbor-redis image
throw "Image 'harbor-redis' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "harbor-redis";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "999";
#
#   labels = {
#     "org.opencontainers.image.title" = "harbor-redis";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
