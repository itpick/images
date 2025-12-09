{ buildCLIImage, pkgs, lib, ... }:

# Image: datadog-operator
# Reference: https://images.chainguard.dev/directory/image/datadog-operator/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   datadog-operator (1.20.0-r1)
#   ld-linux (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement datadog-operator image
throw "Image 'datadog-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "datadog-operator";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "datadog-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
