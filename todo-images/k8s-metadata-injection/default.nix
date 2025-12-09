{ buildCLIImage, pkgs, lib, ... }:

# Image: k8s-metadata-injection
# Reference: https://images.chainguard.dev/directory/image/k8s-metadata-injection/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   bash-binsh (5.3-r3)
#   ld-linux (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   newrelic-k8s-metadata-injection (1.39.0-r1)

# TODO: Implement k8s-metadata-injection image
throw "Image 'k8s-metadata-injection' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "k8s-metadata-injection";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "k8s-metadata-injection";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
