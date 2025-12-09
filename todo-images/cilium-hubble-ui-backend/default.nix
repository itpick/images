{ buildCLIImage, pkgs, lib, ... }:

# Image: cilium-hubble-ui-backend
# Reference: https://images.chainguard.dev/directory/image/cilium-hubble-ui-backend/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gops  # gops (0.3.28-r22)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   hubble-ui-backend (0.13.3-r2)
#   ld-linux (2.42-r4)

# TODO: Implement cilium-hubble-ui-backend image
throw "Image 'cilium-hubble-ui-backend' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cilium-hubble-ui-backend";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cilium-hubble-ui-backend";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
