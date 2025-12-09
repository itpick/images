{ buildCLIImage, pkgs, lib, ... }:

# Image: vertical-pod-autoscaler
# Reference: https://images.chainguard.dev/directory/image/vertical-pod-autoscaler/overview

# TODO: Implement vertical-pod-autoscaler image
throw "Image 'vertical-pod-autoscaler' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "vertical-pod-autoscaler";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "vertical-pod-autoscaler";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
