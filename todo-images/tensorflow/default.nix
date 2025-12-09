{ buildCLIImage, pkgs, lib, ... }:

# Image: tensorflow
# Reference: https://images.chainguard.dev/directory/image/tensorflow/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.binutils  # binutils (2.45.1-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cudatoolkit  # cuda-toolkit-12.3 (12.3-r10)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gcc  # gcc (15.2.0-r6)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.isl  # isl (0.27-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linuxheaders  # linux-headers (6.18-r0)
#   pkgs.fzf-make  # make (4.4.1-r8)
#   pkgs.mpc  # mpc (1.3.1-r7)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.mpfr  # mpfr (4.2.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.pkgconf  # pkgconf (2.5.1-r1)
#   pkgs.python  # python-3.11 (3.11.14-r3)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.unzip  # unzip (6.0-r3)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   build-base (1-r9)
#   glibc-dev (2.42-r4)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libatomic (15.2.0-r6)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libgomp (15.2.0-r6)
#   libldap-2.6 (2.6.10-r7)
#   libquadmath (15.2.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libstdc++-dev (15.2.0-r6)
#   libxcrypt-dev (4.5.2-r0)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nss-db (2.42-r4)
#   nss-hesiod (2.42-r4)
#   nvidia-cuda-cudart-12.3 (12.3.101-r12)
#   nvidia-cuda-ld-config-12.3 (1-r7)
#   nvidia-cuda-nvcc-12.3 (12.3.107-r6)
#   nvidia-cuda-nvml-dev-12.3 (12.3.101-r5)
#   nvidia-cuda-nvrtc-12.3 (12.3.107-r3)
#   nvidia-cuda-nvtx-12.3 (12.3.101-r7)
#   nvidia-cudnn-9-cuda-12 (9.14.0.64-r1)
#   nvidia-cudnn-9-ld-config (9.16.0.29-r0)
#   nvidia-libcublas-12.3 (12.3.4.1-r7)
#   nvidia-libcufft-12.3 (11.0.12.1-r8)
#   nvidia-libcurand-12.3 (10.3.4.107-r3)
#   nvidia-libcusolver-12.3 (11.5.4.101-r10)
#   nvidia-libcusparse-12.3 (12.2.0.103-r10)
#   nvidia-libnvjitlink-12.3 (12.3.101-r11)
#   openssf-compiler-options (20250904-r2)
#   posix-cc-wrappers (2-r7)
#   py3-pip-wheel (25.3-r2)
#   py3-setuptools-wheel (80.9.0-r3)
#   py3.11-pip (25.3-r2)
#   py3.11-pip-base (25.3-r2)
#   py3.11-setuptools (80.9.0-r4)
#   python-3.11-base (3.11.14-r3)
#   sqlite-libs (3.51.1-r0)
#   tensorflow-gpu-jupyter (2.20.0-r4)

# TODO: Implement tensorflow image
throw "Image 'tensorflow' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.binutils;
#   name = "tensorflow";
#   tag = "v${pkgs.binutils.version}";
#   entrypoint = [ "${pkgs.binutils}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "tensorflow";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
