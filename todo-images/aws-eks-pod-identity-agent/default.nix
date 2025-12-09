{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-eks-pod-identity-agent
# Reference: https://images.chainguard.dev/directory/image/aws-eks-pod-identity-agent/overview

# Packages NOT in nixpkgs (need custom derivations):
#   aws-eks-pod-identity-agent (0.1.36-r1)
#   kubernetes-release-go-runner (0.18.0-r5)

# TODO: Implement aws-eks-pod-identity-agent image
throw "Image 'aws-eks-pod-identity-agent' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "aws-eks-pod-identity-agent";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-eks-pod-identity-agent";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
