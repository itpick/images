{ buildCLIImage, pkgs, lib, ... }:

# Image: kserve-rest-proxy
# Reference: https://images.chainguard.dev/directory/image/kserve-rest-proxy/overview

# TODO: Implement kserve-rest-proxy image
throw "Image 'kserve-rest-proxy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kserve-rest-proxy";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kserve-rest-proxy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
