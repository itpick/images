{ buildCLIImage, pkgs, lib, ... }:

# Image: trillian-logserver
# Reference: https://images.chainguard.dev/directory/image/trillian-logserver/overview

# Packages NOT in nixpkgs (need custom derivations):
#   trillian-logserver (1.7.2-r7)

# TODO: Implement trillian-logserver image
throw "Image 'trillian-logserver' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "trillian-logserver";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "trillian-logserver";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
