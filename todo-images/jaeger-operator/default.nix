{ buildCLIImage, pkgs, lib, ... }:

# Image: jaeger-operator
# Reference: https://images.chainguard.dev/directory/image/jaeger-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   jaeger-operator (1.65.0-r11)

# TODO: Implement jaeger-operator image
throw "Image 'jaeger-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jaeger-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "jaeger-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
