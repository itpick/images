{ buildCLIImage, pkgs, lib, ... }:

# Image: mysql-client
# Reference: https://images.chainguard.dev/directory/image/mysql-client/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   mysql-9.5-client (9.5.0-r1)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement mysql-client image
throw "Image 'mysql-client' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "mysql-client";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "mysql-client";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
