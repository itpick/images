{ buildCLIImage, pkgs, lib, ... }:

# Image: vertical-pod-autoscaler-fips
# Reference: https://images.chainguard.dev/directory/image/vertical-pod-autoscaler-fips/overview

# TODO: Implement vertical-pod-autoscaler-fips image
throw "Image 'vertical-pod-autoscaler-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "vertical-pod-autoscaler-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "vertical-pod-autoscaler-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
