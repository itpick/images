{ buildCLIImage, pkgs, lib, ... }:

# Image: argo-events
# Reference: https://images.chainguard.dev/directory/image/argo-events/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   argo-events (1.9.9-r0)
#   ld-linux (2.42-r4)

# TODO: Implement argo-events image
throw "Image 'argo-events' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "argo-events";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "argo-events";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
