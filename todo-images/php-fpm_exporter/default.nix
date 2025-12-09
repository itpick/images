{ buildCLIImage, pkgs, lib, ... }:

# Image: php-fpm_exporter
# Reference: https://images.chainguard.dev/directory/image/php-fpm_exporter/overview

# TODO: Implement php-fpm_exporter image
throw "Image 'php-fpm_exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "php-fpm_exporter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "php-fpm_exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
