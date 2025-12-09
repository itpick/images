{ buildCLIImage, pkgs, lib, ... }:

# Image: postgres-operator
# Reference: https://images.chainguard.dev/directory/image/postgres-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   postgres-operator (1.15.0-r2)

# TODO: Implement postgres-operator image
throw "Image 'postgres-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "postgres-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "postgres-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
