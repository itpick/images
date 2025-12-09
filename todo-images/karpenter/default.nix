{ buildCLIImage, pkgs, lib, ... }:

# Image: karpenter
# Reference: https://images.chainguard.dev/directory/image/karpenter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   karpenter-1.8 (1.8.2-r1)

# TODO: Implement karpenter image
throw "Image 'karpenter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "karpenter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "karpenter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
