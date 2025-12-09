{ buildCLIImage, pkgs, lib, ... }:

# Image: pytorch
# Reference: https://images.chainguard.dev/directory/image/pytorch/overview

# Packages available in nixpkgs:
#   pkgs.cudatoolkit  # cuda-toolkit-12.8 (12.8-r4)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.lcms2  # lcms2 (2.17-r5)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libpng  # libpng (1.6.52-r0)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libwebp  # libwebp (1.6.0-r1)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openblas  # openblas (0.3.30-r4)
#   pkgs.openjpeg  # openjpeg (2.5.4-r0)
#   pkgs.python  # python-3.13 (3.13.10-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libgfortran (15.2.0-r6)
#   libgomp (15.2.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libtorch-cuda-12.8 (2.9.1-r0)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nvidia-cuda-cudart-12.8 (12.8.90-r3)
#   nvidia-cuda-cupti-12.8 (12.8.90-r2)
#   nvidia-cuda-ld-config-12.8 (1-r7)
#   nvidia-cuda-nvcc-12.8 (12.8.93-r5)
#   nvidia-cuda-nvml-dev-12.8 (12.8.90-r4)
#   nvidia-cuda-nvrtc-12.8 (12.8.93-r2)
#   nvidia-cuda-nvtx-12.8 (12.8.90-r2)
#   nvidia-cudnn-9-cuda-12 (9.14.0.64-r1)
#   nvidia-cudnn-9-ld-config (9.16.0.29-r0)
#   nvidia-libcublas-12.8 (12.8.4.1-r1)
#   nvidia-libcufft-12.8 (11.3.3.83-r2)
#   nvidia-libcufile-12.8 (1.13.1.3-r1)
#   nvidia-libcurand-12.8 (10.3.9.90-r2)
#   nvidia-libcusolver-12.8 (11.7.3.90-r2)
#   nvidia-libcusparse-12.8 (12.5.8.93-r3)
#   nvidia-libnpp-12.8 (12.3.3.100-r3)
#   nvidia-libnvjitlink-12.8 (12.8.93-r2)
#   nvidia-libnvjpeg-12.8 (12.3.5.92-r2)
#   nvidia-nccl-cuda-12.8 (2.28.9-r0)
#   py3-pip-wheel (25.3-r2)
#   py3.13-astunparse (1.6.3-r9)
#   py3.13-certifi (2025.11.12-r0)
#   py3.13-charset-normalizer (3.4.4-r2)
#   py3.13-filelock (3.20.0-r0)
#   py3.13-fsspec (2025.12.0-r0)
#   py3.13-idna (3.11-r0)
#   py3.13-jinja2 (3.1.6-r1)
#   py3.13-markupsafe (3.0.3-r0)
#   py3.13-mpmath (1.3.0-r6)
#   py3.13-networkx (3.6-r0)
#   py3.13-numpy-2.2 (2.2.6-r4)
#   py3.13-packaging (25.0-r2)
#   py3.13-pillow (12.0.0-r0)
#   py3.13-pygments (2.19.2-r3)
#   py3.13-pyparsing (3.2.5-r0)
#   py3.13-pyyaml (6.0.3-r0)
#   py3.13-requests (2.32.5-r0)
#   py3.13-setuptools (80.9.0-r4)
#   py3.13-six (1.17.0-r2)
#   py3.13-sympy (1.14.0-r2)
#   py3.13-torch-cuda-12.8 (2.9.1-r0)
#   py3.13-torch-cuda-12.8-bin (2.9.1-r0)
#   py3.13-torchvision-cuda-12.8 (0.24.1-r0)
#   py3.13-typing-extensions (4.15.0-r0)
#   py3.13-urllib3 (2.5.0-r2)
#   py3.13-wheel (0.46.1-r5)
#   python-3.13-base (3.13.10-r0)
#   sqlite-libs (3.51.1-r0)
#   tiff (4.7.1-r0)

# TODO: Implement pytorch image
throw "Image 'pytorch' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cudatoolkit;
#   name = "pytorch";
#   tag = "v${pkgs.cudatoolkit.version}";
#   entrypoint = [ "${pkgs.cudatoolkit}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "pytorch";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
