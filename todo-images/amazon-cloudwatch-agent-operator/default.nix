{ buildCLIImage, pkgs, lib, ... }:

# Image: amazon-cloudwatch-agent-operator
# Reference: https://images.chainguard.dev/directory/image/amazon-cloudwatch-agent-operator/overview

# TODO: Implement amazon-cloudwatch-agent-operator image
throw "Image 'amazon-cloudwatch-agent-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "amazon-cloudwatch-agent-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "amazon-cloudwatch-agent-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
