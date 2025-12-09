{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-gcp-storage
# Reference: https://images.chainguard.dev/directory/image/crossplane-gcp-storage/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-gcp-storage (2.3.0-r0)

# TODO: Implement crossplane-gcp-storage image
throw "Image 'crossplane-gcp-storage' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-gcp-storage";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-gcp-storage";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
