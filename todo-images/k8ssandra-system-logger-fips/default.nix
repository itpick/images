{ buildCLIImage, pkgs, lib, ... }:

# Image: k8ssandra-system-logger-fips
# Reference: https://images.chainguard.dev/directory/image/k8ssandra-system-logger-fips/overview

# TODO: Implement k8ssandra-system-logger-fips image
throw "Image 'k8ssandra-system-logger-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "k8ssandra-system-logger-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "k8ssandra-system-logger-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
