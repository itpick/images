{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-redis-exporter-iamguarded
# Reference: https://images.chainguard.dev/directory/image/prometheus-redis-exporter-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.prometheus-redis-exporter  # prometheus-redis-exporter (1.80.1-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement prometheus-redis-exporter-iamguarded image
throw "Image 'prometheus-redis-exporter-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "prometheus-redis-exporter-iamguarded";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-redis-exporter-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
