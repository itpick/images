{ buildCLIImage, pkgs, lib, ... }:

# Image: ratify-crds
# Reference: https://images.chainguard.dev/directory/image/ratify-crds/overview

# Packages available in nixpkgs:
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)

# Packages NOT in nixpkgs (need custom derivations):
#   kubectl-1.34-default (1.34.2-r3)
#   ratify-crds (1.4.0-r8)

# TODO: Implement ratify-crds image
throw "Image 'ratify-crds' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.kubectl;
#   name = "ratify-crds";
#   tag = "v${pkgs.kubectl.version}";
#   entrypoint = [ "${pkgs.kubectl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ratify-crds";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
