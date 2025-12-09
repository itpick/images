{ buildCLIImage, pkgs, lib, ... }:

# Image: arangodb
# Reference: https://images.chainguard.dev/directory/image/arangodb/overview

# Packages available in nixpkgs:
#   pkgs.arangodb  # arangodb-3.12 (3.12.7-r0)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libllvm  # libllvm-19 (19.1.7-r14)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nodejs  # nodejs-25 (25.2.1-r0)
#   pkgs.numactl  # numactl (2.0.19-r2)
#   pkgs.openblas  # openblas (0.3.30-r4)
#   pkgs.pwgen  # pwgen (2.08-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   bash-binsh (5.3-r3)
#   foxx-cli (2.1.1-r2)
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libatomic (15.2.0-r6)
#   libattr1 (2.5.2-r54)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libcrypto3 (3.6.0-r4)
#   libgfortran (15.2.0-r6)
#   libgomp (15.2.0-r6)
#   libicu78 (78.1-r0)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openmp-19 (19.1.7-r2)

# TODO: Implement arangodb image
throw "Image 'arangodb' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.arangodb;
#   name = "arangodb";
#   tag = "v${pkgs.arangodb.version}";
#   entrypoint = [ "${pkgs.arangodb}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "arangodb";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
