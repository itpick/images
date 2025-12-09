{ buildCLIImage, pkgs, lib, ... }:

# Image: calico-pod2daemon-flexvol
# Reference: https://images.chainguard.dev/directory/image/calico-pod2daemon-flexvol/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.calico-pod2daemon  # calico-pod2daemon-3.31 (3.31.2-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement calico-pod2daemon-flexvol image
throw "Image 'calico-pod2daemon-flexvol' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.calico-pod2daemon;
#   name = "calico-pod2daemon-flexvol";
#   tag = "v${pkgs.calico-pod2daemon.version}";
#   entrypoint = [ "${pkgs.calico-pod2daemon}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "calico-pod2daemon-flexvol";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
