{ buildCLIImage, pkgs, lib, ... }:

# Image: metallb-controller
# Reference: https://images.chainguard.dev/directory/image/metallb-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   metallb-controller (0.15.3-r0)

# TODO: Implement metallb-controller image
throw "Image 'metallb-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "metallb-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65534";
#
#   labels = {
#     "org.opencontainers.image.title" = "metallb-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
