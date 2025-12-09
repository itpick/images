{ buildCLIImage, pkgs, lib, ... }:

# Image: cis-operator
# Reference: https://images.chainguard.dev/directory/image/cis-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cis-operator-1.4 (1.4.5-r1)

# TODO: Implement cis-operator image
throw "Image 'cis-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cis-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65534";
#
#   labels = {
#     "org.opencontainers.image.title" = "cis-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
