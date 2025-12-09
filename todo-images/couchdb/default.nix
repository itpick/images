{ buildCLIImage, pkgs, lib, ... }:

# Image: couchdb
# Reference: https://images.chainguard.dev/directory/image/couchdb/overview

# TODO: Implement couchdb image
throw "Image 'couchdb' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "couchdb";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "couchdb";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
