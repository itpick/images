{ buildCLIImage, pkgs, lib, ... }:

# Image: hailo-ai-onnxruntime
# Reference: https://images.chainguard.dev/directory/image/hailo-ai-onnxruntime/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.binutils  # binutils (2.45.1-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.gcc  # gcc (15.2.0-r6)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.isl  # isl (0.27-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linuxheaders  # linux-headers (6.18-r0)
#   pkgs.fzf-make  # make (4.4.1-r8)
#   pkgs.mpc  # mpc (1.3.1-r7)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.mpfr  # mpfr (4.2.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openblas  # openblas (0.3.30-r4)
#   pkgs.pkgconf  # pkgconf (2.5.1-r1)
#   pkgs.python  # python-3.12 (3.12.12-r2)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   bash-binsh (5.3-r3)
#   build-base (1-r9)
#   glibc-dev (2.42-r4)
#   hailo-ai-onnxruntime (4.23.0-r0)
#   hailo-ai-onnxruntime-dev (4.23.0-r0)
#   hailort (4.23.0-r0)
#   ld-linux (2.42-r4)
#   libatomic (15.2.0-r6)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libgfortran (15.2.0-r6)
#   libgomp (15.2.0-r6)
#   libquadmath (15.2.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libstdc++-dev (15.2.0-r6)
#   libxcrypt-dev (4.5.2-r0)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nss-db (2.42-r4)
#   nss-hesiod (2.42-r4)
#   openssf-compiler-options (20250904-r2)
#   posix-cc-wrappers (2-r7)
#   py3-pip-wheel (25.3-r2)
#   py3.12-coloredlogs (15.0.1-r1)
#   py3.12-flatbuffers (25.9.23-r0)
#   py3.12-hailo-ai-onnxruntime (4.23.0-r0)
#   py3.12-humanfriendly (10.0-r7)
#   py3.12-mpmath (1.3.0-r6)
#   py3.12-numpy-2.2 (2.2.6-r4)
#   py3.12-packaging (25.0-r2)
#   py3.12-protobuf (6.33.2-r0)
#   py3.12-pygments (2.19.2-r3)
#   py3.12-pyparsing (3.2.5-r0)
#   py3.12-sympy (1.14.0-r2)
#   python-3.12-base (3.12.12-r2)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement hailo-ai-onnxruntime image
throw "Image 'hailo-ai-onnxruntime' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.binutils;
#   name = "hailo-ai-onnxruntime";
#   tag = "v${pkgs.binutils.version}";
#   entrypoint = [ "${pkgs.binutils}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "hailo-ai-onnxruntime";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
