{ buildCLIImage, pkgs, lib, ... }:

# Image: metallb-speaker
# Reference: https://images.chainguard.dev/directory/image/metallb-speaker/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   metallb-cp-tool (0.15.3-r0)
#   metallb-frr (0.15.3-r0)
#   metallb-speaker (0.15.3-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement metallb-speaker image
throw "Image 'metallb-speaker' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "metallb-speaker";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "metallb-speaker";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
