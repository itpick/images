{ buildCLIImage, pkgs, lib, ... }:

# Image: flux-source-controller-iamguarded
# Reference: https://images.chainguard.dev/directory/image/flux-source-controller-iamguarded/overview

# Packages NOT in nixpkgs (need custom derivations):
#   flux-source-controller (1.7.4-r3)

# TODO: Implement flux-source-controller-iamguarded image
throw "Image 'flux-source-controller-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "flux-source-controller-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1337";
#
#   labels = {
#     "org.opencontainers.image.title" = "flux-source-controller-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
