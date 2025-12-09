{ buildCLIImage, pkgs, lib, ... }:

# Image: metrics-agent
# Reference: https://images.chainguard.dev/directory/image/metrics-agent/overview

# TODO: Implement metrics-agent image
throw "Image 'metrics-agent' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "metrics-agent";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "metrics-agent";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
