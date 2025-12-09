{ buildCLIImage, pkgs, lib, ... }:

# Image: cassandra-medusa
# Reference: https://images.chainguard.dev/directory/image/cassandra-medusa/overview

# TODO: Implement cassandra-medusa image
throw "Image 'cassandra-medusa' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cassandra-medusa";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "999";
#
#   labels = {
#     "org.opencontainers.image.title" = "cassandra-medusa";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
