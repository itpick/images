{ buildCLIImage, pkgs, lib, ... }:

# Image: tekton-resolvers
# Reference: https://images.chainguard.dev/directory/image/tekton-resolvers/overview

# TODO: Implement tekton-resolvers image
throw "Image 'tekton-resolvers' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "tekton-resolvers";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tekton-resolvers";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
