{ buildCLIImage, pkgs, lib, ... }:

# Image: k6-operator
# Reference: https://images.chainguard.dev/directory/image/k6-operator/overview

# TODO: Implement k6-operator image
throw "Image 'k6-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "k6-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "k6-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
