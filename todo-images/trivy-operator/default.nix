{ buildCLIImage, pkgs, lib, ... }:

# Image: trivy-operator
# Reference: https://images.chainguard.dev/directory/image/trivy-operator/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   trivy-operator (0.29.0-r5)

# TODO: Implement trivy-operator image
throw "Image 'trivy-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "trivy-operator";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "10000";
#
#   labels = {
#     "org.opencontainers.image.title" = "trivy-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
