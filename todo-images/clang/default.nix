{ buildCLIImage, pkgs, lib, ... }:

# Image: clang
# Reference: https://images.chainguard.dev/directory/image/clang/overview

# Packages available in nixpkgs:
#   pkgs.binutils  # binutils (2.45.1-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.clang  # clang-21 (21.1.7-r0)
#   pkgs.gcc  # gcc (15.2.0-r6)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.isl  # isl (0.27-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libllvm  # libllvm-21 (21.1.7-r0)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.linuxheaders  # linux-headers (6.18-r0)
#   pkgs.llvm  # llvm-21 (21.1.7-r0)
#   pkgs.fzf-make  # make (4.4.1-r8)
#   pkgs.mpc  # mpc (1.3.1-r7)
#   pkgs.mpfr  # mpfr (4.2.2-r2)
#   pkgs.pkgconf  # pkgconf (2.5.1-r1)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   build-base (1-r9)
#   glibc-dev (2.42-r4)
#   ld-linux (2.42-r4)
#   libatomic (15.2.0-r6)
#   libclang-cpp-21 (21.1.7-r0)
#   libcrypt1 (2.42-r4)
#   libgomp (15.2.0-r6)
#   libquadmath (15.2.0-r6)
#   libstdc++ (15.2.0-r6)
#   libstdc++-dev (15.2.0-r6)
#   libxcrypt-dev (4.5.2-r0)
#   libzstd1 (1.5.7-r5)
#   nss-db (2.42-r4)
#   nss-hesiod (2.42-r4)
#   openssf-compiler-options (20250904-r2)
#   posix-cc-wrappers (2-r7)

# TODO: Implement clang image
throw "Image 'clang' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.clang;
#   name = "clang";
#   tag = "v${pkgs.clang.version}";
#   entrypoint = [ "${pkgs.clang}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "clang";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
