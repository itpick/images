{ buildCLIImage, pkgs, lib, ... }:

# Image: pgbouncer
# Reference: https://images.chainguard.dev/directory/image/pgbouncer/overview

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

# TODO: Implement pgbouncer image
throw "Image 'pgbouncer' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.pgbouncer;
#   name = "pgbouncer";
#   tag = "v${pkgs.pgbouncer.version}";
#   entrypoint = [ "${pkgs.pgbouncer}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "pgbouncer";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
