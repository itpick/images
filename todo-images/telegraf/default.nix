{ buildCLIImage, pkgs, lib, ... }:

# Image: telegraf
# Reference: https://images.chainguard.dev/directory/image/telegraf/overview

# TODO: Implement telegraf image
throw "Image 'telegraf' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "telegraf";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "telegraf";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
