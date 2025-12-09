{ buildCLIImage, pkgs, lib, ... }:

# Image: opentelemetry-operator
# Reference: https://images.chainguard.dev/directory/image/opentelemetry-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   opentelemetry-operator (0.140.0-r1)

# TODO: Implement opentelemetry-operator image
throw "Image 'opentelemetry-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "opentelemetry-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "opentelemetry-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
