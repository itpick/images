{ buildCLIImage, pkgs, lib, ... }:

# Image: tigera-operator
# Reference: https://images.chainguard.dev/directory/image/tigera-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   tigera-operator-1.40 (1.40.2-r2)

# TODO: Implement tigera-operator image
throw "Image 'tigera-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "tigera-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tigera-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
