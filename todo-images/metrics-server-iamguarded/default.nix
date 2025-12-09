{ buildCLIImage, pkgs, lib, ... }:

# Image: metrics-server-iamguarded
# Reference: https://images.chainguard.dev/directory/image/metrics-server-iamguarded/overview

# Packages NOT in nixpkgs (need custom derivations):
#   metrics-server (0.8.0-r5)

# TODO: Implement metrics-server-iamguarded image
throw "Image 'metrics-server-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "metrics-server-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "metrics-server-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
