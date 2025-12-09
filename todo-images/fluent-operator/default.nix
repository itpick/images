{ buildCLIImage, pkgs, lib, ... }:

# Image: fluent-operator
# Reference: https://images.chainguard.dev/directory/image/fluent-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   fluent-operator (3.5.0-r2)

# TODO: Implement fluent-operator image
throw "Image 'fluent-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "fluent-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "fluent-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
