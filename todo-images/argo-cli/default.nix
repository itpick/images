{ buildCLIImage, pkgs, lib, ... }:

# Image: argo-cli
# Reference: https://images.chainguard.dev/directory/image/argo-cli/overview

# Packages available in nixpkgs:
#   pkgs.argo-workflows  # argo-workflows-3.7 (3.7.4-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   argo-workflow-cli-3.7 (3.7.4-r2)
#   argo-workflows-known-hosts-3.7 (3.7.4-r2)

# TODO: Implement argo-cli image
throw "Image 'argo-cli' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.argo-workflows;
#   name = "argo-cli";
#   tag = "v${pkgs.argo-workflows.version}";
#   entrypoint = [ "${pkgs.argo-workflows}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "argo-cli";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
