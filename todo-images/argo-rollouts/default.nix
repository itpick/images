{ buildCLIImage, pkgs, lib, ... }:

# Image: argo-rollouts
# Reference: https://images.chainguard.dev/directory/image/argo-rollouts/overview

# Packages available in nixpkgs:
#   pkgs.argo-rollouts  # argo-rollouts (1.8.3-r6)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement argo-rollouts image
throw "Image 'argo-rollouts' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.argo-rollouts;
#   name = "argo-rollouts";
#   tag = "v${pkgs.argo-rollouts.version}";
#   entrypoint = [ "${pkgs.argo-rollouts}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "argo-rollouts";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
