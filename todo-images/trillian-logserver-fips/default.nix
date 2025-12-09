{ buildCLIImage, pkgs, lib, ... }:

# Image: trillian-logserver-fips
# Reference: https://images.chainguard.dev/directory/image/trillian-logserver-fips/overview

# TODO: Implement trillian-logserver-fips image
throw "Image 'trillian-logserver-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "trillian-logserver-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "trillian-logserver-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
