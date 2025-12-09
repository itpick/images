{ buildCLIImage, pkgs, lib, ... }:

# Image: selenium-standalone-docker
# Reference: https://images.chainguard.dev/directory/image/selenium-standalone-docker/overview

# TODO: Implement selenium-standalone-docker image
throw "Image 'selenium-standalone-docker' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "selenium-standalone-docker";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1200";
#
#   labels = {
#     "org.opencontainers.image.title" = "selenium-standalone-docker";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
