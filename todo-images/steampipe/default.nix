{ buildCLIImage, pkgs, lib, ... }:

# Image: steampipe
# Reference: https://images.chainguard.dev/directory/image/steampipe/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.binutils  # binutils (2.45.1-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.gcc  # gcc (15.2.0-r6)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.isl  # isl (0.27-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linuxheaders  # linux-headers (6.18-r0)
#   pkgs.mpc  # mpc (1.3.1-r7)
#   pkgs.mpfr  # mpfr (4.2.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   glibc-dev (2.42-r4)
#   ld-linux (2.42-r4)
#   libatomic (15.2.0-r6)
#   libcrypt1 (2.42-r4)
#   libgomp (15.2.0-r6)
#   libquadmath (15.2.0-r6)
#   libstdc++ (15.2.0-r6)
#   libstdc++-dev (15.2.0-r6)
#   libxcrypt-dev (4.5.2-r0)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nss-db (2.42-r4)
#   nss-hesiod (2.42-r4)
#   openssf-compiler-options (20250904-r2)
#   posix-cc-wrappers (2-r7)

# TODO: Implement steampipe image
throw "Image 'steampipe' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.binutils;
#   name = "steampipe";
#   tag = "v${pkgs.binutils.version}";
#   entrypoint = [ "${pkgs.binutils}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "9193";
#
#   labels = {
#     "org.opencontainers.image.title" = "steampipe";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
