{ buildCLIImage, pkgs, lib, ... }:

# Image: apache-beam-python-sdk
# Reference: https://images.chainguard.dev/directory/image/apache-beam-python-sdk/overview

# TODO: Implement apache-beam-python-sdk image
throw "Image 'apache-beam-python-sdk' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "apache-beam-python-sdk";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "apache-beam-python-sdk";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
