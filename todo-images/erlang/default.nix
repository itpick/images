{ buildCLIImage, pkgs, lib, ... }:

# Image: erlang
# Reference: https://images.chainguard.dev/directory/image/erlang/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.erlang  # erlang-28 (28.2-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement erlang image
throw "Image 'erlang' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.erlang;
#   name = "erlang";
#   tag = "v${pkgs.erlang.version}";
#   entrypoint = [ "${pkgs.erlang}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "erlang";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
