{ buildCLIImage, pkgs, lib, ... }:

# Image: cloudprober
# Reference: https://images.chainguard.dev/directory/image/cloudprober/overview

# TODO: Implement cloudprober image
throw "Image 'cloudprober' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cloudprober";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cloudprober";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
