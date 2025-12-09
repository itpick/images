{ buildCLIImage, pkgs, lib, ... }:

# Image: octo-sts
# Reference: https://images.chainguard.dev/directory/image/octo-sts/overview

# Packages NOT in nixpkgs (need custom derivations):
#   octo-sts (0.5.3-r3)

# TODO: Implement octo-sts image
throw "Image 'octo-sts' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "octo-sts";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "octo-sts";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
