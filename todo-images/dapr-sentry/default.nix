{ buildCLIImage, pkgs, lib, ... }:

# Image: dapr-sentry
# Reference: https://images.chainguard.dev/directory/image/dapr-sentry/overview

# Packages NOT in nixpkgs (need custom derivations):
#   dapr-sentry-1.15 (1.15.13-r3)

# TODO: Implement dapr-sentry image
throw "Image 'dapr-sentry' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "dapr-sentry";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "dapr-sentry";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
