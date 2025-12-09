{ buildCLIImage, pkgs, lib, ... }:

# Image: k8s-mig-manager
# Reference: https://images.chainguard.dev/directory/image/k8s-mig-manager/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r2)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libnvidia-container  # libnvidia-container (1.18.1-r1)
#   pkgs.libseccomp  # libseccomp (2.6.0-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nvidia-container-toolkit  # nvidia-container-toolkit (1.18.1-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   kubectl-1.34-default (1.34.2-r2)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   mig-parted (0.13.1-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement k8s-mig-manager image
throw "Image 'k8s-mig-manager' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "k8s-mig-manager";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "k8s-mig-manager";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
