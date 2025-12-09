{ buildCLIImage, pkgs, lib, ... }:

# Image: temporal-server-fips
# Reference: https://images.chainguard.dev/directory/image/temporal-server-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   dockerize-fips (0.9.8-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   posix-libc-utils (2.42-r4)
#   temporal-fips (1.5.1-r1)
#   temporal-server-fips (1.29.1-r2)
#   temporal-server-oci-entrypoint-fips (1.29.1-r2)

# TODO: Implement temporal-server-fips image
throw "Image 'temporal-server-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "temporal-server-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "temporal-server-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
