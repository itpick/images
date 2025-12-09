{ buildCLIImage, pkgs, lib, ... }:

# Image: grafana-alloy
# Reference: https://images.chainguard.dev/directory/image/grafana-alloy/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.grafana-alloy  # grafana-alloy (1.12.0-r1)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libsystemd (258.2-r3)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement grafana-alloy image
throw "Image 'grafana-alloy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.grafana-alloy;
#   name = "grafana-alloy";
#   tag = "v${pkgs.grafana-alloy.version}";
#   entrypoint = [ "${pkgs.grafana-alloy}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "473";
#
#   labels = {
#     "org.opencontainers.image.title" = "grafana-alloy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
