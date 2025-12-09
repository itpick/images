{ buildCLIImage, pkgs, lib, ... }:

# Image: opentelemetry-operator-target-allocator
# Reference: https://images.chainguard.dev/directory/image/opentelemetry-operator-target-allocator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   opentelemetry-operator-otel-allocator (0.140.0-r1)

# TODO: Implement opentelemetry-operator-target-allocator image
throw "Image 'opentelemetry-operator-target-allocator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "opentelemetry-operator-target-allocator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "opentelemetry-operator-target-allocator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
