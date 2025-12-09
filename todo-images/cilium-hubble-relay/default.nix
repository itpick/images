{ buildCLIImage, pkgs, lib, ... }:

# Image: cilium-hubble-relay
# Reference: https://images.chainguard.dev/directory/image/cilium-hubble-relay/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gops  # gops (0.3.28-r22)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   cilium-1.18-hubble-relay (1.18.4-r2)
#   ld-linux (2.42-r4)

# TODO: Implement cilium-hubble-relay image
throw "Image 'cilium-hubble-relay' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cilium-hubble-relay";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cilium-hubble-relay";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
