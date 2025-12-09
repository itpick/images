{ buildCLIImage, pkgs, lib, ... }:

# Image: tekton-sidecarlogresults
# Reference: https://images.chainguard.dev/directory/image/tekton-sidecarlogresults/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.tini  # tini (0.19.0-r22)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   tekton-pipelines-sidecarlogresults-1.5 (1.5.0-r2)

# TODO: Implement tekton-sidecarlogresults image
throw "Image 'tekton-sidecarlogresults' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "tekton-sidecarlogresults";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tekton-sidecarlogresults";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
