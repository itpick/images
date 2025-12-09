{ buildCLIImage, pkgs, lib, ... }:

# Image: nrdot-collector-k8s
# Reference: https://images.chainguard.dev/directory/image/nrdot-collector-k8s/overview

# Packages NOT in nixpkgs (need custom derivations):
#   nrdot-collector-k8s (1.6.0-r2)

# TODO: Implement nrdot-collector-k8s image
throw "Image 'nrdot-collector-k8s' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "nrdot-collector-k8s";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "nrdot-collector-k8s";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
