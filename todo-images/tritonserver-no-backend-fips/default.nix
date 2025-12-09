{ buildCLIImage, pkgs, lib, ... }:

# Image: tritonserver-no-backend-fips
# Reference: https://images.chainguard.dev/directory/image/tritonserver-no-backend-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.crc32c  # crc32c (1.1.2-r4)
#   pkgs.cudatoolkit  # cuda-toolkit-13.0 (13.0-r1)
#   pkgs.fmt  # fmt (10.2.1-r0)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libb64  # libb64-1.2 (1.2.1-r3)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libllvm  # libllvm-17 (17.0.6-r10)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.numactl  # numactl (2.0.19-r2)
#   pkgs.openblas  # openblas (0.3.30-r4)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yaml-cpp  # yaml-cpp (0.8.0-r10)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   dcgm-cuda-13.0 (4.4.1-r4)
#   ld-linux (2.42-r4)
#   libboost-filesystem1.89.0 (1.89.0-r2)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libgfortran (15.2.0-r6)
#   libgomp (15.2.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nvidia-cuda-crt-13.0 (13.0.48-r2)
#   nvidia-cuda-cudart-13.0 (13.0.96-r0)
#   nvidia-cuda-cupti-13.0 (13.0.85-r0)
#   nvidia-cuda-ld-config-13.0 (1-r8)
#   nvidia-cuda-nvcc-13.0 (13.0.48-r3)
#   nvidia-cuda-nvml-dev-13.0 (13.0.87-r0)
#   nvidia-cuda-nvrtc-13.0 (13.0.88-r0)
#   nvidia-cuda-nvtx-13.0 (13.0.85-r0)
#   nvidia-dcgm-libdcgmmoduleprofiling (4.4.2-r0)
#   nvidia-libcublas-13.0 (13.1.0.3-r0)
#   nvidia-libcufft-13.0 (12.0.0.61-r0)
#   nvidia-libcurand-13.0 (10.4.0.35-r0)
#   nvidia-libcusolver-13.0 (12.0.4.66-r0)
#   nvidia-libcusparse-13.0 (12.6.3.3-r0)
#   nvidia-libnvjitlink-13.0 (13.0.88-r0)
#   nvidia-libnvptxcompiler-13.0 (13.0.88-r0)
#   nvidia-libnvvm-13.0 (13.0.88-r0)
#   nvidia-nccl-cuda-13.0 (2.28.9-r0)
#   openmp-17 (17.0.6-r9)
#   openmp-17-dev (17.0.6-r9)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   prometheus-cpp-core (1.3.0-r1)
#   py3-pip-wheel (25.3-r2)
#   py3.12-numpy-2.2 (2.2.6-r4)
#   py3.12-pygments (2.19.2-r3)
#   python-3.12-base (3.12.12-r2)
#   sqlite-libs (3.51.1-r0)
#   tritonserver-cuda-13.0 (2.63.0-r2)

# TODO: Implement tritonserver-no-backend-fips image
throw "Image 'tritonserver-no-backend-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.c-ares;
#   name = "tritonserver-no-backend-fips";
#   tag = "v${pkgs.c-ares.version}";
#   entrypoint = [ "${pkgs.c-ares}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tritonserver-no-backend-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
