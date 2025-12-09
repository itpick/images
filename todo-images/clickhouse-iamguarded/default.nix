{ buildCLIImage, pkgs, lib, ... }:

# Image: clickhouse-iamguarded
# Reference: https://images.chainguard.dev/directory/image/clickhouse-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.clickhouse  # clickhouse-25.11 (25.11.2.24-r0)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.libxslt  # libxslt (1.1.45-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.xmlstarlet  # xmlstarlet (1.6.1-r9)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement clickhouse-iamguarded image
throw "Image 'clickhouse-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.clickhouse;
#   name = "clickhouse-iamguarded";
#   tag = "v${pkgs.clickhouse.version}";
#   entrypoint = [ "${pkgs.clickhouse}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "clickhouse-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
