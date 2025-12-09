{ buildCLIImage, pkgs, lib, ... }:

# Image: plugin-barman-cloud
# Reference: https://images.chainguard.dev/directory/image/plugin-barman-cloud/overview

# TODO: Implement plugin-barman-cloud image
throw "Image 'plugin-barman-cloud' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "plugin-barman-cloud";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "plugin-barman-cloud";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
