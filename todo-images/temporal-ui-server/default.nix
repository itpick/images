{ buildCLIImage, pkgs, lib, ... }:

# Image: temporal-ui-server
# Reference: https://images.chainguard.dev/directory/image/temporal-ui-server/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.temporal-ui-server  # temporal-ui-server (2.43.3-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   dockerize (0.9.8-r1)
#   ld-linux (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   temporal-ui-server-oci-entrypoint (2.43.3-r2)

# TODO: Implement temporal-ui-server image
throw "Image 'temporal-ui-server' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.temporal-ui-server;
#   name = "temporal-ui-server";
#   tag = "v${pkgs.temporal-ui-server.version}";
#   entrypoint = [ "${pkgs.temporal-ui-server}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "temporal-ui-server";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
