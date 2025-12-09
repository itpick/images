{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-load-balancer-controller
# Reference: https://images.chainguard.dev/directory/image/aws-load-balancer-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   aws-load-balancer-controller (2.16.0-r2)

# TODO: Implement aws-load-balancer-controller image
throw "Image 'aws-load-balancer-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "aws-load-balancer-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-load-balancer-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
