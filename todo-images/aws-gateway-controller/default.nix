{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-gateway-controller
# Reference: https://images.chainguard.dev/directory/image/aws-gateway-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   aws-application-networking-k8s (1.1.7-r2)

# TODO: Implement aws-gateway-controller image
throw "Image 'aws-gateway-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "aws-gateway-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-gateway-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
