{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-gcp-provider-family
# Reference: https://images.chainguard.dev/directory/image/crossplane-gcp-provider-family/overview

# TODO: Implement crossplane-gcp-provider-family image
throw "Image 'crossplane-gcp-provider-family' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-gcp-provider-family";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-gcp-provider-family";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
