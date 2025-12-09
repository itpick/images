{ buildCLIImage, pkgs, lib, ... }:

# Image: pvc-autoresizer
# Reference: https://images.chainguard.dev/directory/image/pvc-autoresizer/overview

# Packages NOT in nixpkgs (need custom derivations):
#   pvc-autoresizer (0.18.0-r2)

# TODO: Implement pvc-autoresizer image
throw "Image 'pvc-autoresizer' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "pvc-autoresizer";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "10000";
#
#   labels = {
#     "org.opencontainers.image.title" = "pvc-autoresizer";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
