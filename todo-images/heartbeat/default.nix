{ buildCLIImage, pkgs, lib, ... }:

# Image: heartbeat
# Reference: https://images.chainguard.dev/directory/image/heartbeat/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.heartbeat  # heartbeat-9.2 (9.2.2-r2)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.tini  # tini (0.19.0-r22)

# Packages NOT in nixpkgs (need custom derivations):
#   heartbeat-9.2-oci-entrypoint (9.2.2-r2)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement heartbeat image
throw "Image 'heartbeat' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.heartbeat;
#   name = "heartbeat";
#   tag = "v${pkgs.heartbeat.version}";
#   entrypoint = [ "${pkgs.heartbeat}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "heartbeat";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
