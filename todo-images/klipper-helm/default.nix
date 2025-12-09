{ buildCLIImage, pkgs, lib, ... }:

# Image: klipper-helm
# Reference: https://images.chainguard.dev/directory/image/klipper-helm/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.helm  # helm-3 (3.19.2-r2)
#   pkgs.jq  # jq (1.8.1-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.oniguruma  # oniguruma (6.9.10-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   helm-mapkubeapis (0.6.1-r7)
#   helm-set-status (0.3.0-r8)
#   klipper-helm (0.9.10.20251111-r1)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement klipper-helm image
throw "Image 'klipper-helm' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "klipper-helm";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "klipper-helm";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
