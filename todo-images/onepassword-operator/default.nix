{ buildCLIImage, pkgs, lib, ... }:

# Image: onepassword-operator
# Reference: https://images.chainguard.dev/directory/image/onepassword-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   onepassword-operator (1.10.0-r1)

# TODO: Implement onepassword-operator image
throw "Image 'onepassword-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "onepassword-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "onepassword-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
