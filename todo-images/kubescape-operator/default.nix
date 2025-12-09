{ buildCLIImage, pkgs, lib, ... }:

# Image: kubescape-operator
# Reference: https://images.chainguard.dev/directory/image/kubescape-operator/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   kubescape-operator (0.2.116-r1)
#   ld-linux (2.42-r4)

# TODO: Implement kubescape-operator image
throw "Image 'kubescape-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kubescape-operator";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubescape-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
