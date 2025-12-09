{ buildCLIImage, pkgs, lib, ... }:

# Image: flux-image-automation-controller-iamguarded
# Reference: https://images.chainguard.dev/directory/image/flux-image-automation-controller-iamguarded/overview

# Packages NOT in nixpkgs (need custom derivations):
#   flux-image-automation-controller (1.0.4-r3)

# TODO: Implement flux-image-automation-controller-iamguarded image
throw "Image 'flux-image-automation-controller-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "flux-image-automation-controller-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "flux-image-automation-controller-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
