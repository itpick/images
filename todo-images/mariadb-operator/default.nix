{ buildCLIImage, pkgs, lib, ... }:

# Image: mariadb-operator
# Reference: https://images.chainguard.dev/directory/image/mariadb-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   mariadb-operator (25.10.2-r2)

# TODO: Implement mariadb-operator image
throw "Image 'mariadb-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "mariadb-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "mariadb-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
