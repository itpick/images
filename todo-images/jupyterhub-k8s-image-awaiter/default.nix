{ buildCLIImage, pkgs, lib, ... }:

# Image: jupyterhub-k8s-image-awaiter
# Reference: https://images.chainguard.dev/directory/image/jupyterhub-k8s-image-awaiter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   jupyterhub-k8s-image-awaiter (4.3.1-r1)

# TODO: Implement jupyterhub-k8s-image-awaiter image
throw "Image 'jupyterhub-k8s-image-awaiter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jupyterhub-k8s-image-awaiter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "jupyterhub-k8s-image-awaiter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
