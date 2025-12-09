{ buildCLIImage, pkgs, lib, ... }:

# Image: jenkins-inbound-agent
# Reference: https://images.chainguard.dev/directory/image/jenkins-inbound-agent/overview

# TODO: Implement jenkins-inbound-agent image
throw "Image 'jenkins-inbound-agent' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jenkins-inbound-agent";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "jenkins-inbound-agent";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
