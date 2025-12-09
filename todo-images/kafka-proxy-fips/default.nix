{ buildCLIImage, pkgs, lib, ... }:

# Image: kafka-proxy-fips
# Reference: https://images.chainguard.dev/directory/image/kafka-proxy-fips/overview

# TODO: Implement kafka-proxy-fips image
throw "Image 'kafka-proxy-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kafka-proxy-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "kafka-proxy-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
