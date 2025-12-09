{ buildCLIImage, pkgs, lib, ... }:

# Image: verticadb-operator
# Reference: https://images.chainguard.dev/directory/image/verticadb-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   verticadb-operator (25.4.0.0-r1)

# TODO: Implement verticadb-operator image
throw "Image 'verticadb-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "verticadb-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "verticadb-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
