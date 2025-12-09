{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-s3-controller
# Reference: https://images.chainguard.dev/directory/image/aws-s3-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   aws-s3-controller (1.2.0-r1)

# TODO: Implement aws-s3-controller image
throw "Image 'aws-s3-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "aws-s3-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-s3-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
