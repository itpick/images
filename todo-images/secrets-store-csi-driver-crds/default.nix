{ buildCLIImage, pkgs, lib, ... }:

# Image: secrets-store-csi-driver-crds
# Reference: https://images.chainguard.dev/directory/image/secrets-store-csi-driver-crds/overview

# Packages available in nixpkgs:
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   kubectl-1.34-default (1.34.2-r1)
#   secrets-store-csi-driver-crds (1.5.4-r2)

# TODO: Implement secrets-store-csi-driver-crds image
throw "Image 'secrets-store-csi-driver-crds' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.kubectl;
#   name = "secrets-store-csi-driver-crds";
#   tag = "v${pkgs.kubectl.version}";
#   entrypoint = [ "${pkgs.kubectl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "secrets-store-csi-driver-crds";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
