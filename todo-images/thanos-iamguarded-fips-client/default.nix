{ buildCLIImage, pkgs, lib, ... }:

# Image: thanos-iamguarded-fips-client
# Reference: https://images.chainguard.dev/directory/image/thanos-iamguarded-fips-client/overview

# TODO: Implement thanos-iamguarded-fips-client image
throw "Image 'thanos-iamguarded-fips-client' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "thanos-iamguarded-fips-client";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "thanos-iamguarded-fips-client";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
