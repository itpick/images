{ buildCLIImage, pkgs, lib, ... }:

# Image: pypy
# Reference: https://images.chainguard.dev/directory/image/pypy/overview

# Packages available in nixpkgs:
#   pkgs.binutils  # binutils (2.45.1-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.gcc  # gcc (15.2.0-r6)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.isl  # isl (0.27-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linuxheaders  # linux-headers (6.18-r0)
#   pkgs.mpc  # mpc (1.3.1-r7)
#   pkgs.mpfr  # mpfr (4.2.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.pypy  # pypy-3.11 (7.3.20-r4)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   bzip2-dev (1.0.8-r21)
#   glibc-dev (2.42-r4)
#   ld-linux (2.42-r4)
#   libatomic (15.2.0-r6)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
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
#   posix-cc-wrappers (2-r7)
#   py3-pip-wheel (25.3-r2)
#   py3-setuptools-wheel (80.9.0-r3)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement pypy image
throw "Image 'pypy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.pypy;
#   name = "pypy";
#   tag = "v${pkgs.pypy.version}";
#   entrypoint = [ "${pkgs.pypy}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "pypy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
