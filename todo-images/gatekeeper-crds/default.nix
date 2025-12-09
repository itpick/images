{ buildCLIImage, pkgs, lib, ... }:

# Image: gatekeeper-crds
# Reference: https://images.chainguard.dev/directory/image/gatekeeper-crds/overview

# Packages available in nixpkgs:
#   pkgs.gatekeeper  # gatekeeper-3.21 (3.21.0-r2)
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   gatekeeper-3.21-crds (3.21.0-r2)
#   kubectl-1.34-default (1.34.2-r1)

# TODO: Implement gatekeeper-crds image
throw "Image 'gatekeeper-crds' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.gatekeeper;
#   name = "gatekeeper-crds";
#   tag = "v${pkgs.gatekeeper.version}";
#   entrypoint = [ "${pkgs.gatekeeper}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "gatekeeper-crds";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
