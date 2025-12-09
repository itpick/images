{ buildCLIImage, pkgs, lib, ... }:

# Image: harbor-exporter-fips
# Reference: https://images.chainguard.dev/directory/image/harbor-exporter-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   bash-binsh (5.3-r3)
#   harbor-fips-2.14-exporter (2.14.1-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement harbor-exporter-fips image
throw "Image 'harbor-exporter-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "harbor-exporter-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "10000";
#
#   labels = {
#     "org.opencontainers.image.title" = "harbor-exporter-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
