{ buildCLIImage, pkgs, lib, ... }:

# Image: thanos-operator
# Reference: https://images.chainguard.dev/directory/image/thanos-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   thanos-operator (0.3.7-r35)

# TODO: Implement thanos-operator image
throw "Image 'thanos-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "thanos-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "thanos-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
