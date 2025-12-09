{ buildCLIImage, pkgs, lib, ... }:

# Image: trillian-logsigner
# Reference: https://images.chainguard.dev/directory/image/trillian-logsigner/overview

# Packages NOT in nixpkgs (need custom derivations):
#   trillian-logsigner (1.7.2-r7)

# TODO: Implement trillian-logsigner image
throw "Image 'trillian-logsigner' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "trillian-logsigner";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "trillian-logsigner";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
