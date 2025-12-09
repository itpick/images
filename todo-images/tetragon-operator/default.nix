{ buildCLIImage, pkgs, lib, ... }:

# Image: tetragon-operator
# Reference: https://images.chainguard.dev/directory/image/tetragon-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   tetragon-operator (1.6.0-r1)

# TODO: Implement tetragon-operator image
throw "Image 'tetragon-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "tetragon-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tetragon-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
