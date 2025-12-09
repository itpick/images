{ buildCLIImage, pkgs, lib, ... }:

# Image: image-factory-fips
# Reference: https://images.chainguard.dev/directory/image/image-factory-fips/overview

# TODO: Implement image-factory-fips image
throw "Image 'image-factory-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "image-factory-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "image-factory-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
