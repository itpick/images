{ buildCLIImage, pkgs, lib, ... }:

# Image: kserve-controller
# Reference: https://images.chainguard.dev/directory/image/kserve-controller/overview

# TODO: Implement kserve-controller image
throw "Image 'kserve-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kserve-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kserve-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
