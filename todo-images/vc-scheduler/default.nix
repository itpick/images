{ buildCLIImage, pkgs, lib, ... }:

# Image: vc-scheduler
# Reference: https://images.chainguard.dev/directory/image/vc-scheduler/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   vc-scheduler (1.13.0-r6)

# TODO: Implement vc-scheduler image
throw "Image 'vc-scheduler' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "vc-scheduler";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "vc-scheduler";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
