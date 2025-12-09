{ buildCLIImage, pkgs, lib, ... }:

# Image: tekton-webhook
# Reference: https://images.chainguard.dev/directory/image/tekton-webhook/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.tini  # tini (0.19.0-r22)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   tekton-pipelines-webhook-1.5 (1.5.0-r2)

# TODO: Implement tekton-webhook image
throw "Image 'tekton-webhook' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "tekton-webhook";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tekton-webhook";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
