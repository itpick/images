{ buildCLIImage, pkgs, lib, ... }:

# Image: gogatekeeper
# Reference: https://images.chainguard.dev/directory/image/gogatekeeper/overview

# Packages NOT in nixpkgs (need custom derivations):
#   gogatekeeper (4.3.0-r3)

# TODO: Implement gogatekeeper image
throw "Image 'gogatekeeper' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "gogatekeeper";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "gogatekeeper";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
