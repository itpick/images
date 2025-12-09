{ buildCLIImage, pkgs, lib, ... }:

# Image: pgbouncer-fips
# Reference: https://images.chainguard.dev/directory/image/pgbouncer-fips/overview

# Packages available in nixpkgs:
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libevent  # libevent (2.1.12-r8)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.pgbouncer  # pgbouncer (1.25.0-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement pgbouncer-fips image
throw "Image 'pgbouncer-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.c-ares;
#   name = "pgbouncer-fips";
#   tag = "v${pkgs.c-ares.version}";
#   entrypoint = [ "${pkgs.c-ares}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "pgbouncer-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
