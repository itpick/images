{ buildCLIImage, pkgs, lib, ... }:

# Image: gha-runner-scale-set-controller
# Reference: https://images.chainguard.dev/directory/image/gha-runner-scale-set-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   actions-runner-controller (0.13.0-r3)

# TODO: Implement gha-runner-scale-set-controller image
throw "Image 'gha-runner-scale-set-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "gha-runner-scale-set-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "gha-runner-scale-set-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
