{ buildCLIImage, pkgs, lib, ... }:

# Image: cass-operator
# Reference: https://images.chainguard.dev/directory/image/cass-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cass-operator (1.28.0-r1)

# TODO: Implement cass-operator image
throw "Image 'cass-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cass-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cass-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
