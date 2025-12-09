{ buildCLIImage, pkgs, lib, ... }:

# Image: octo-sts-webhook
# Reference: https://images.chainguard.dev/directory/image/octo-sts-webhook/overview

# Packages NOT in nixpkgs (need custom derivations):
#   octo-sts-webhook (0.5.3-r3)

# TODO: Implement octo-sts-webhook image
throw "Image 'octo-sts-webhook' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "octo-sts-webhook";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "octo-sts-webhook";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
