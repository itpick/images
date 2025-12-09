{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-gcp-kms
# Reference: https://images.chainguard.dev/directory/image/crossplane-gcp-kms/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-gcp-kms (2.3.0-r0)

# TODO: Implement crossplane-gcp-kms image
throw "Image 'crossplane-gcp-kms' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-gcp-kms";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-gcp-kms";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
