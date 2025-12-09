{ buildCLIImage, pkgs, lib, ... }:

# Image: temporal-server
# Reference: https://images.chainguard.dev/directory/image/temporal-server/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.temporal  # temporal (1.5.1-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   dockerize (0.9.9-r0)
#   ld-linux (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   posix-libc-utils (2.42-r4)
#   temporal-server (1.29.1-r1)
#   temporal-server-oci-entrypoint (1.29.1-r1)

# TODO: Implement temporal-server image
throw "Image 'temporal-server' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "temporal-server";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "temporal-server";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
