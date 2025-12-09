{ buildCLIImage, pkgs, lib, ... }:

# Image: haproxy-iamguarded-fips
# Reference: https://images.chainguard.dev/directory/image/haproxy-iamguarded-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.haproxy  # haproxy-3.3 (3.3.0-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   dataplaneapi-fips (3.2.7-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   lua5.3-libs (5.3.6-r11)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement haproxy-iamguarded-fips image
throw "Image 'haproxy-iamguarded-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "haproxy-iamguarded-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "haproxy-iamguarded-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
