{ buildCLIImage, pkgs, lib, ... }:

# Image: amazon-k8s-cni-init
# Reference: https://images.chainguard.dev/directory/image/amazon-k8s-cni-init/overview

# Packages NOT in nixpkgs (need custom derivations):
#   amazon-k8s-cni-init (1.20.5-r1)

# TODO: Implement amazon-k8s-cni-init image
throw "Image 'amazon-k8s-cni-init' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "amazon-k8s-cni-init";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "amazon-k8s-cni-init";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
