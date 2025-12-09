{ buildCLIImage, pkgs, lib, ... }:

# Image: kafka-proxy
# Reference: https://images.chainguard.dev/directory/image/kafka-proxy/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kafka-proxy (0.4.3-r6)

# TODO: Implement kafka-proxy image
throw "Image 'kafka-proxy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kafka-proxy";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "kafka-proxy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
