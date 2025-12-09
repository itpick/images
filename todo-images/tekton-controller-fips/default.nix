{ buildCLIImage, pkgs, lib, ... }:

# Image: tekton-controller-fips
# Reference: https://images.chainguard.dev/directory/image/tekton-controller-fips/overview

# TODO: Implement tekton-controller-fips image
throw "Image 'tekton-controller-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "tekton-controller-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tekton-controller-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
