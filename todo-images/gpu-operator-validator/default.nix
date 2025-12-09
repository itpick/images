{ buildCLIImage, pkgs, lib, ... }:

# Image: gpu-operator-validator
# Reference: https://images.chainguard.dev/directory/image/gpu-operator-validator/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nvidia-cuda-vectoradd-12.4 (12.4.1-r3)
#   nvidia-gpu-operator-validator-24.3 (24.3.0-r18)

# TODO: Implement gpu-operator-validator image
throw "Image 'gpu-operator-validator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "gpu-operator-validator";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "gpu-operator-validator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
