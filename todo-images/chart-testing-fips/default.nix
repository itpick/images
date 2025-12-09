{ buildCLIImage, pkgs, lib, ... }:

# Image: chart-testing-fips
# Reference: https://images.chainguard.dev/directory/image/chart-testing-fips/overview

# TODO: Implement chart-testing-fips image
throw "Image 'chart-testing-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "chart-testing-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "chart-testing-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
