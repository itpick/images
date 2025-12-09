{ buildCLIImage, pkgs, lib, ... }:

# Image: sbt-fips
# Reference: https://images.chainguard.dev/directory/image/sbt-fips/overview

# TODO: Implement sbt-fips image
throw "Image 'sbt-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sbt-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sbt-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
