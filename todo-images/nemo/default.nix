{ buildCLIImage, pkgs, lib, ... }:

# Image: nemo
# Reference: https://images.chainguard.dev/directory/image/nemo/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cudatoolkit  # cuda-toolkit-12.3 (12.3-r10)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.isl  # isl (0.27-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libllvm  # libllvm-17 (17.0.6-r10)
#   pkgs.libpng  # libpng (1.6.53-r0)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.mpc  # mpc (1.3.1-r7)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.mpfr  # mpfr (4.2.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nemo  # nemo (2.5.3-r1)
#   pkgs.openblas  # openblas (0.3.30-r4)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libgfortran (15.2.0-r6)
#   libgomp (15.2.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nvidia-cuda-cudart-12.3 (12.3.101-r12)
#   nvidia-cuda-cupti-12.3 (12.3.101-r2)
#   nvidia-cuda-ld-config-12.3 (1-r8)
#   nvidia-cuda-nvcc-12.3 (12.3.107-r6)
#   nvidia-cuda-nvml-dev-12.3 (12.3.101-r5)
#   nvidia-cuda-nvrtc-12.3 (12.3.107-r3)
#   nvidia-cuda-nvtx-12.3 (12.3.101-r7)
#   nvidia-cudnn-8-cuda-12 (8.9.7.29-r11)
#   nvidia-cudnn-8-ld-config (8.9.7.29-r11)
#   nvidia-libcublas-12.3 (12.3.4.1-r7)
#   nvidia-libcufft-12.3 (11.0.12.1-r8)
#   nvidia-libcurand-12.3 (10.3.4.107-r3)
#   nvidia-libcusolver-12.3 (11.5.4.101-r10)
#   nvidia-libcusparse-12.3 (12.2.0.103-r10)
#   nvidia-libnvjitlink-12.3 (12.3.101-r11)
#   nvidia-nccl-cuda-12.3 (2.22.3-r9)
#   openmp-17 (17.0.6-r9)
#   openmp-17-dev (17.0.6-r9)
#   py3-pip-wheel (25.3-r2)
#   py3-setuptools-wheel (80.9.0-r3)
#   py3.11-numpy-2.2 (2.2.6-r4)
#   py3.11-pygments (2.19.2-r3)
#   py3.11-pyyaml (6.0.3-r0)
#   py3.11-torchvision-cuda-12.3 (0.18.1-r14)
#   py3.11-typing-extensions (4.15.0-r0)
#   python-3.11-base (3.11.14-r3)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement nemo image
throw "Image 'nemo' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.nemo;
#   name = "nemo";
#   tag = "v${pkgs.nemo.version}";
#   entrypoint = [ "${pkgs.nemo}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "nemo";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
