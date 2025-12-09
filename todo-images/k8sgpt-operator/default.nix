{ buildCLIImage, pkgs, lib, ... }:

# Image: k8sgpt-operator
# Reference: https://images.chainguard.dev/directory/image/k8sgpt-operator/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   k8sgpt-operator (0.2.24-r2)
#   ld-linux (2.42-r4)

# TODO: Implement k8sgpt-operator image
throw "Image 'k8sgpt-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "k8sgpt-operator";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "k8sgpt-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
