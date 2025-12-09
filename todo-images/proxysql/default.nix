{ buildCLIImage, pkgs, lib, ... }:

# Image: proxysql
# Reference: https://images.chainguard.dev/directory/image/proxysql/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.gnutls  # gnutls (3.8.11-r0)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libtasn1  # libtasn1 (4.20.0-r5)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nettle  # nettle (3.10.2-r1)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.proxysql  # proxysql (3.0.3-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   gmp-dev (6.3.0-r8)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   mysql-9.5-client (9.5.0-r1)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement proxysql image
throw "Image 'proxysql' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.proxysql;
#   name = "proxysql";
#   tag = "v${pkgs.proxysql.version}";
#   entrypoint = [ "${pkgs.proxysql}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "proxysql";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
