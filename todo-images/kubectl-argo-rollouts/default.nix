{ buildCLIImage, pkgs, lib, ... }:

# Image: kubectl-argo-rollouts
# Reference: https://images.chainguard.dev/directory/image/kubectl-argo-rollouts/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   kubectl-argo-rollouts (1.8.3-r6)
#   ld-linux (2.42-r4)

# TODO: Implement kubectl-argo-rollouts image
throw "Image 'kubectl-argo-rollouts' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kubectl-argo-rollouts";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubectl-argo-rollouts";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
