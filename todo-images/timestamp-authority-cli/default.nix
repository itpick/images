{ buildCLIImage, pkgs, lib, ... }:

# Image: timestamp-authority-cli
# Reference: https://images.chainguard.dev/directory/image/timestamp-authority-cli/overview

# Packages NOT in nixpkgs (need custom derivations):
#   timestamp-authority-cli (2.0.3-r0)

# TODO: Implement timestamp-authority-cli image
throw "Image 'timestamp-authority-cli' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "timestamp-authority-cli";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "timestamp-authority-cli";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
