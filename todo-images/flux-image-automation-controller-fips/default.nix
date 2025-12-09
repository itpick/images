{ buildCLIImage, pkgs, lib, ... }:

# Image: flux-image-automation-controller-fips
# Reference: https://images.chainguard.dev/directory/image/flux-image-automation-controller-fips/overview

# TODO: Implement flux-image-automation-controller-fips image
throw "Image 'flux-image-automation-controller-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "flux-image-automation-controller-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "flux-image-automation-controller-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
