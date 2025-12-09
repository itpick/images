{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-privateca-issuer
# Reference: https://images.chainguard.dev/directory/image/aws-privateca-issuer/overview

# Packages NOT in nixpkgs (need custom derivations):
#   aws-privateca-issuer (1.7.1-r1)

# TODO: Implement aws-privateca-issuer image
throw "Image 'aws-privateca-issuer' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "aws-privateca-issuer";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-privateca-issuer";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
