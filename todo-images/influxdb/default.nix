{ buildCLIImage, pkgs, lib, ... }:

# Image: influxdb
# Reference: https://images.chainguard.dev/directory/image/influxdb/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.yq  # yq (4.49.2-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   influx (2.7.5-r12)
#   influxd-2.7 (2.7.12-r9)
#   influxd-oci-entrypoint (2.7.12-r9)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement influxdb image
throw "Image 'influxdb' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "influxdb";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "influxdb";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
