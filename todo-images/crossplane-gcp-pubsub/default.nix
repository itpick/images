{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-gcp-pubsub
# Reference: https://images.chainguard.dev/directory/image/crossplane-gcp-pubsub/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-gcp-pubsub (2.3.0-r0)

# TODO: Implement crossplane-gcp-pubsub image
throw "Image 'crossplane-gcp-pubsub' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-gcp-pubsub";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-gcp-pubsub";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
