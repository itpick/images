{ buildCLIImage, pkgs, lib, ... }:

# Image: jupyterhub-k8s-image-awaiter-fips
# Reference: https://images.chainguard.dev/directory/image/jupyterhub-k8s-image-awaiter-fips/overview

# TODO: Implement jupyterhub-k8s-image-awaiter-fips image
throw "Image 'jupyterhub-k8s-image-awaiter-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jupyterhub-k8s-image-awaiter-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "jupyterhub-k8s-image-awaiter-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
