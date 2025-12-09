{ buildCLIImage, pkgs, lib, ... }:

# Image: argo-exec
# Reference: https://images.chainguard.dev/directory/image/argo-exec/overview

# Packages NOT in nixpkgs (need custom derivations):
#   argo-workflow-executor-3.7 (3.7.4-r2)
#   argo-workflows-known-hosts-3.7 (3.7.4-r2)

# TODO: Implement argo-exec image
throw "Image 'argo-exec' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "argo-exec";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "argo-exec";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
