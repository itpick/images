{ buildCLIImage, pkgs, lib, ... }:

# Image: k8sgpt
# Reference: https://images.chainguard.dev/directory/image/k8sgpt/overview

# Packages available in nixpkgs:
#   pkgs.k8sgpt  # k8sgpt (0.4.26-r2)

# TODO: Implement k8sgpt image
throw "Image 'k8sgpt' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.k8sgpt;
#   name = "k8sgpt";
#   tag = "v${pkgs.k8sgpt.version}";
#   entrypoint = [ "${pkgs.k8sgpt}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "k8sgpt";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
