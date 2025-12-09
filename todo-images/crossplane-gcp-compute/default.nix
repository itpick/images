{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-gcp-compute
# Reference: https://images.chainguard.dev/directory/image/crossplane-gcp-compute/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-gcp-compute (2.3.0-r0)

# TODO: Implement crossplane-gcp-compute image
throw "Image 'crossplane-gcp-compute' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-gcp-compute";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-gcp-compute";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
