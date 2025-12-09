{ buildCLIImage, pkgs, lib, ... }:

# Image: sqlpad
# Reference: https://images.chainguard.dev/directory/image/sqlpad/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nodejs  # nodejs-20 (20.19.6-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.unixodbc  # unixodbc (2.3.14-r0)
#   pkgs.yarn  # yarn (1.22.22-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libcrypto3 (3.6.0-r4)
#   libicu78 (78.1-r0)
#   libltdl (2.5.4-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   sqlpad (7.5.7-r3)

# TODO: Implement sqlpad image
throw "Image 'sqlpad' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.c-ares;
#   name = "sqlpad";
#   tag = "v${pkgs.c-ares.version}";
#   entrypoint = [ "${pkgs.c-ares}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sqlpad";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
