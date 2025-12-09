{ buildCLIImage, pkgs, lib, ... }:

# Image: regclient-fips
# Reference: https://images.chainguard.dev/directory/image/regclient-fips/overview

# TODO: Implement regclient-fips image
throw "Image 'regclient-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "regclient-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "regclient-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
