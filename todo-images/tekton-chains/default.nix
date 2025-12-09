{ buildCLIImage, pkgs, lib, ... }:

# Image: tekton-chains
# Reference: https://images.chainguard.dev/directory/image/tekton-chains/overview

# Packages NOT in nixpkgs (need custom derivations):
#   tekton-chains (0.26.0-r2)

# TODO: Implement tekton-chains image
throw "Image 'tekton-chains' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "tekton-chains";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tekton-chains";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
