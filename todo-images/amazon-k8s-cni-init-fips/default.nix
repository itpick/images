{ buildCLIImage, pkgs, lib, ... }:

# Image: amazon-k8s-cni-init-fips
# Reference: https://images.chainguard.dev/directory/image/amazon-k8s-cni-init-fips/overview

# TODO: Implement amazon-k8s-cni-init-fips image
throw "Image 'amazon-k8s-cni-init-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "amazon-k8s-cni-init-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "amazon-k8s-cni-init-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
