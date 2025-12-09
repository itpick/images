{ buildCLIImage, pkgs, lib, ... }:

# Image: dapr-operator
# Reference: https://images.chainguard.dev/directory/image/dapr-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   dapr-operator-1.15 (1.15.13-r3)

# TODO: Implement dapr-operator image
throw "Image 'dapr-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "dapr-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "dapr-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
