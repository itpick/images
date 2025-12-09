{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-volume-modifier-for-k8s
# Reference: https://images.chainguard.dev/directory/image/aws-volume-modifier-for-k8s/overview

# Packages NOT in nixpkgs (need custom derivations):
#   volume-modifier-for-k8s (0.9.0-r1)

# TODO: Implement aws-volume-modifier-for-k8s image
throw "Image 'aws-volume-modifier-for-k8s' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "aws-volume-modifier-for-k8s";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-volume-modifier-for-k8s";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
