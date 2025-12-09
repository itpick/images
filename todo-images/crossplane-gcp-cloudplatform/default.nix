{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-gcp-cloudplatform
# Reference: https://images.chainguard.dev/directory/image/crossplane-gcp-cloudplatform/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-gcp-cloudplatform (2.3.0-r0)

# TODO: Implement crossplane-gcp-cloudplatform image
throw "Image 'crossplane-gcp-cloudplatform' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-gcp-cloudplatform";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-gcp-cloudplatform";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
