{ buildCLIImage, pkgs, lib, ... }:

# Image: yunikorn-web
# Reference: https://images.chainguard.dev/directory/image/yunikorn-web/overview

# Packages NOT in nixpkgs (need custom derivations):
#   yunikorn-web (1.7.0-r3)

# TODO: Implement yunikorn-web image
throw "Image 'yunikorn-web' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "yunikorn-web";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "4444";
#
#   labels = {
#     "org.opencontainers.image.title" = "yunikorn-web";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
