{ buildCLIImage, pkgs, lib, ... }:

# Image: tekton-events
# Reference: https://images.chainguard.dev/directory/image/tekton-events/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.tini  # tini (0.19.0-r22)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   tekton-pipelines-events-1.5 (1.5.0-r2)

# TODO: Implement tekton-events image
throw "Image 'tekton-events' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "tekton-events";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tekton-events";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
