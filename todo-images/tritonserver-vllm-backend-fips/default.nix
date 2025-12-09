{ buildCLIImage, pkgs, lib, ... }:

# Image: tritonserver-vllm-backend-fips
# Reference: https://images.chainguard.dev/directory/image/tritonserver-vllm-backend-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.binutils  # binutils (2.45.1-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.crc32c  # crc32c (1.1.2-r4)
#   pkgs.cudatoolkit  # cuda-toolkit-12.9 (12.9-r4)
#   pkgs.fmt  # fmt (10.2.1-r0)
#   pkgs.gcc  # gcc (15.2.0-r6)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.isl  # isl (0.27-r4)
#   pkgs.libarchive  # libarchive (3.8.4-r0)
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
#   pkgs.linuxheaders  # linux-headers (6.18-r0)
#   pkgs.fzf-make  # make (4.4.1-r8)
#   pkgs.mpc  # mpc (1.3.1-r7)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.mpfr  # mpfr (4.2.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.numactl  # numactl (2.0.19-r2)
#   pkgs.openblas  # openblas (0.3.30-r4)
#   pkgs.pkgconf  # pkgconf (2.5.1-r1)
#   pkgs.python  # python-3.12 (3.12.12-r2)
#   pkgs.rapidjson  # rapidjson (1.1.0-r5)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yaml-cpp  # yaml-cpp (0.8.0-r10)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   build-base (1-r9)
#   dcgm-cuda-12.9 (4.4.1-r1)
#   glibc-dev (2.42-r4)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libatomic (15.2.0-r6)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libgfortran (15.2.0-r6)
#   libgomp (15.2.0-r6)
#   liblz4-1 (1.10.0-r6)
#   libquadmath (15.2.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libstdc++-14 (14.3.0-r9)
#   libstdc++-dev (15.2.0-r6)
#   libxcrypt-dev (4.5.2-r0)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nss-db (2.42-r4)
#   nss-hesiod (2.42-r4)
#   nvidia-cuda-cudart-12.9 (12.9.79-r3)
#   nvidia-cuda-cupti-12.9 (12.9.79-r2)
#   nvidia-cuda-ld-config-12.9 (1-r7)
#   nvidia-cuda-nvcc-12.9 (12.9.86-r5)
#   nvidia-cuda-nvml-dev-12.9 (12.9.79-r4)
#   nvidia-cuda-nvrtc-12.9 (12.9.86-r2)
#   nvidia-cuda-nvtx-12.9 (12.9.79-r2)
#   nvidia-cudnn-9-cuda-12 (9.14.0.64-r1)
#   nvidia-cudnn-9-cuda-12-dev (9.14.0.64-r1)
#   nvidia-cudnn-9-ld-config (9.16.0.29-r0)
#   nvidia-dcgm-libdcgmmoduleprofiling (4.4.2-r0)
#   nvidia-libcublas-12.9 (12.9.1.4-r1)
#   nvidia-libcufft-12.9 (11.4.1.4-r2)
#   nvidia-libcurand-12.9 (10.3.10.19-r2)
#   nvidia-libcusolver-12.9 (11.7.5.82-r2)
#   nvidia-libcusparse-12.9 (12.5.10.65-r2)
#   nvidia-libnvjitlink-12.9 (12.9.86-r3)
#   nvidia-nccl-cuda-12.9 (2.28.9-r0)
#   openmp-17 (17.0.6-r9)
#   openmp-17-dev (17.0.6-r9)
#   openssf-compiler-options (20250904-r2)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   posix-cc-wrappers (2-r7)
#   prometheus-cpp-core (1.3.0-r1)
#   py3-pip-wheel (25.3-r2)
#   py3.12-numpy-2.2 (2.2.6-r4)
#   py3.12-pygments (2.19.2-r3)
#   python-3.12-base (3.12.12-r2)
#   sqlite-libs (3.51.1-r0)
#   tritonserver-backend-python-cuda-12.9 (25.07-r1)
#   tritonserver-backend-vllm-cuda-12.9 (25.9.0_git20251112-r1)
#   tritonserver-backend-vllm-meta-cuda-12.9 (25.9.0_git20251112-r1)
#   tritonserver-cuda-12.9 (2.63.0-r0)

# TODO: Implement tritonserver-vllm-backend-fips image
throw "Image 'tritonserver-vllm-backend-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.binutils;
#   name = "tritonserver-vllm-backend-fips";
#   tag = "v${pkgs.binutils.version}";
#   entrypoint = [ "${pkgs.binutils}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tritonserver-vllm-backend-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
