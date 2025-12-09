{ buildCLIImage, pkgs, lib, ... }:

# Image: gpu-operator
# Reference: https://images.chainguard.dev/directory/image/gpu-operator/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   gpu-operator-25.3 (25.3.4-r3)
#   kubectl-1.34-default (1.34.2-r3)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nvidia-cuda-nvml-dev-13.0 (13.0.87-r0)

# TODO: Implement gpu-operator image
throw "Image 'gpu-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "gpu-operator";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "gpu-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
