{ buildCLIImage, pkgs, lib, ... }:

# Image: argo-workflowcontroller
# Reference: https://images.chainguard.dev/directory/image/argo-workflowcontroller/overview

# Packages available in nixpkgs:
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   argo-workflow-controller-3.7 (3.7.4-r2)
#   argo-workflows-known-hosts-3.7 (3.7.4-r2)

# TODO: Implement argo-workflowcontroller image
throw "Image 'argo-workflowcontroller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.tzdata;
#   name = "argo-workflowcontroller";
#   tag = "v${pkgs.tzdata.version}";
#   entrypoint = [ "${pkgs.tzdata}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "argo-workflowcontroller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
