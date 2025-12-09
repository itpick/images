{ buildCLIImage, pkgs, lib, ... }:

# Image: rsyslog
# Reference: https://images.chainguard.dev/directory/image/rsyslog/overview

# TODO: Implement rsyslog image
throw "Image 'rsyslog' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "rsyslog";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "rsyslog";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
