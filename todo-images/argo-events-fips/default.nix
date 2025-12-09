{ buildCLIImage, pkgs, lib, ... }:

# Image: argo-events-fips
# Reference: https://images.chainguard.dev/directory/image/argo-events-fips/overview

# TODO: Implement argo-events-fips image
throw "Image 'argo-events-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "argo-events-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "argo-events-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
