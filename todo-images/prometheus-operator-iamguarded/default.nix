{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-operator-iamguarded
# Reference: https://images.chainguard.dev/directory/image/prometheus-operator-iamguarded/overview

# Packages NOT in nixpkgs (need custom derivations):
#   prometheus-config-reloader (0.87.0-r2)
#   prometheus-operator (0.87.0-r2)

# TODO: Implement prometheus-operator-iamguarded image
throw "Image 'prometheus-operator-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "prometheus-operator-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-operator-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
