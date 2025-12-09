{ buildCLIImage, pkgs, lib, ... }:

# Image: local-volume-node-cleanup
# Reference: https://images.chainguard.dev/directory/image/local-volume-node-cleanup/overview

# Packages NOT in nixpkgs (need custom derivations):
#   local-volume-node-cleanup (2.8.0-r6)

# TODO: Implement local-volume-node-cleanup image
throw "Image 'local-volume-node-cleanup' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "local-volume-node-cleanup";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "local-volume-node-cleanup";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
