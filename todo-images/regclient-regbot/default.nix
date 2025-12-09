{ buildCLIImage, pkgs, lib, ... }:

# Image: regclient-regbot
# Reference: https://images.chainguard.dev/directory/image/regclient-regbot/overview

# Packages NOT in nixpkgs (need custom derivations):
#   regclient-regbot (0.11.0-r0)

# TODO: Implement regclient-regbot image
throw "Image 'regclient-regbot' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "regclient-regbot";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "regclient-regbot";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
