{ buildCLIImage, pkgs, lib, ... }:

# Image: timestamp-authority-server
# Reference: https://images.chainguard.dev/directory/image/timestamp-authority-server/overview

# Packages NOT in nixpkgs (need custom derivations):
#   timestamp-authority-server (2.0.3-r0)

# TODO: Implement timestamp-authority-server image
throw "Image 'timestamp-authority-server' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "timestamp-authority-server";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "timestamp-authority-server";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
