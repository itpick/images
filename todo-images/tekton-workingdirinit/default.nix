{ buildCLIImage, pkgs, lib, ... }:

# Image: tekton-workingdirinit
# Reference: https://images.chainguard.dev/directory/image/tekton-workingdirinit/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.tini  # tini (0.19.0-r22)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   tekton-pipelines-workingdirinit-1.5 (1.5.0-r1)

# TODO: Implement tekton-workingdirinit image
throw "Image 'tekton-workingdirinit' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "tekton-workingdirinit";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tekton-workingdirinit";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
