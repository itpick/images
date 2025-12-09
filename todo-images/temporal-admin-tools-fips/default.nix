{ buildCLIImage, pkgs, lib, ... }:

# Image: temporal-admin-tools-fips
# Reference: https://images.chainguard.dev/directory/image/temporal-admin-tools-fips/overview

# TODO: Implement temporal-admin-tools-fips image
throw "Image 'temporal-admin-tools-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "temporal-admin-tools-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "temporal-admin-tools-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
