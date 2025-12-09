{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-gcp-container
# Reference: https://images.chainguard.dev/directory/image/crossplane-gcp-container/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-gcp-container (2.3.0-r0)

# TODO: Implement crossplane-gcp-container image
throw "Image 'crossplane-gcp-container' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-gcp-container";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-gcp-container";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
