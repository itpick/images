{ buildCLIImage, pkgs, lib, ... }:

# Image: envoy-ratelimit
# Reference: https://images.chainguard.dev/directory/image/envoy-ratelimit/overview

# Packages NOT in nixpkgs (need custom derivations):
#   envoy-ratelimit (0.0.0_git20251207-r0)

# TODO: Implement envoy-ratelimit image
throw "Image 'envoy-ratelimit' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "envoy-ratelimit";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "envoy-ratelimit";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
