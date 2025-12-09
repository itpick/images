{ buildCLIImage, pkgs, lib, ... }:

# Image: rabbitmq
# Reference: https://images.chainguard.dev/directory/image/rabbitmq/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.erlang  # erlang-27 (27.3.4.6-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.rabbitmq-server  # rabbitmq-server-4.2 (4.2.1-r0)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   posix-libc-utils (2.42-r4)

# TODO: Implement rabbitmq image
throw "Image 'rabbitmq' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.rabbitmq-server;
#   name = "rabbitmq";
#   tag = "v${pkgs.rabbitmq-server.version}";
#   entrypoint = [ "${pkgs.rabbitmq-server}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "999";
#
#   labels = {
#     "org.opencontainers.image.title" = "rabbitmq";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
