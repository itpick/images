{ buildCLIImage, pkgs, lib, ... }:

# Image: calico-csi
# Reference: https://images.chainguard.dev/directory/image/calico-csi/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.calico-pod2daemon  # calico-pod2daemon-3.31 (3.31.2-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement calico-csi image
throw "Image 'calico-csi' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.calico-pod2daemon;
#   name = "calico-csi";
#   tag = "v${pkgs.calico-pod2daemon.version}";
#   entrypoint = [ "${pkgs.calico-pod2daemon}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "calico-csi";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
