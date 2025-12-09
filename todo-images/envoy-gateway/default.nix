{ buildCLIImage, pkgs, lib, ... }:

# Image: envoy-gateway
# Reference: https://images.chainguard.dev/directory/image/envoy-gateway/overview

# Packages NOT in nixpkgs (need custom derivations):
#   envoy-gateway (1.6.0-r2)

# TODO: Implement envoy-gateway image
throw "Image 'envoy-gateway' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "envoy-gateway";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "envoy-gateway";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
