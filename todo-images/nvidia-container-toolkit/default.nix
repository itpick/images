{ buildCLIImage, pkgs, lib, ... }:

# Image: nvidia-container-toolkit
# Reference: https://images.chainguard.dev/directory/image/nvidia-container-toolkit/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libnvidia-container  # libnvidia-container (1.18.1-r1)
#   pkgs.libseccomp  # libseccomp (2.6.0-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nvidia-container-toolkit  # nvidia-container-toolkit (1.18.1-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nvidia-container-toolkit-nvidia-cdi-hook (1.18.1-r1)
#   nvidia-container-toolkit-nvidia-container-runtime (1.18.1-r1)
#   nvidia-container-toolkit-nvidia-container-runtime-cdi (1.18.1-r1)
#   nvidia-container-toolkit-nvidia-container-runtime-hook (1.18.1-r1)
#   nvidia-container-toolkit-nvidia-container-runtime-legacy (1.18.1-r1)
#   nvidia-container-toolkit-nvidia-ctk (1.18.1-r1)
#   nvidia-container-toolkit-nvidia-ctk-installer (1.18.1-r1)
#   nvidia-container-toolkit-nvidia-toolkit (1.18.1-r1)
#   nvidia-cuda-cudart-12.3 (12.3.101-r8)
#   nvidia-cuda-nvml-dev-12.3 (12.3.101-r3)

# TODO: Implement nvidia-container-toolkit image
throw "Image 'nvidia-container-toolkit' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.nvidia-container-toolkit;
#   name = "nvidia-container-toolkit";
#   tag = "v${pkgs.nvidia-container-toolkit.version}";
#   entrypoint = [ "${pkgs.nvidia-container-toolkit}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "nvidia-container-toolkit";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
