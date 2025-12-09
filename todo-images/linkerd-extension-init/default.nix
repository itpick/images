{ buildCLIImage, pkgs, lib, ... }:

# Image: linkerd-extension-init
# Reference: https://images.chainguard.dev/directory/image/linkerd-extension-init/overview

# TODO: Implement linkerd-extension-init image
throw "Image 'linkerd-extension-init' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "linkerd-extension-init";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "linkerd-extension-init";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
