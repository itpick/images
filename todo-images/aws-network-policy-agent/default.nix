{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-network-policy-agent
# Reference: https://images.chainguard.dev/directory/image/aws-network-policy-agent/overview

# Packages NOT in nixpkgs (need custom derivations):
#   aws-network-policy-agent (1.2.7-r1)

# TODO: Implement aws-network-policy-agent image
throw "Image 'aws-network-policy-agent' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "aws-network-policy-agent";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-network-policy-agent";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
