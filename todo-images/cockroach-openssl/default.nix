{ buildCLIImage, pkgs, lib, ... }:

# Image: cockroach-openssl
# Reference: https://images.chainguard.dev/directory/image/cockroach-openssl/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.geos  # geos-3.13 (3.13.1-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gnutar  # gnutar (1.35-r6)
#   pkgs.gzip  # gzip (1.14-r2)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.xz  # xz (5.8.1-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   cockroach-openssl-24.1 (24.1.25-r1)
#   geos-3.13-dev (3.13.1-r3)
#   gnutar-rmt (1.35-r6)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement cockroach-openssl image
throw "Image 'cockroach-openssl' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.geos;
#   name = "cockroach-openssl";
#   tag = "v${pkgs.geos.version}";
#   entrypoint = [ "${pkgs.geos}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cockroach-openssl";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
