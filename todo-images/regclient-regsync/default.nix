{ buildCLIImage, pkgs, lib, ... }:

# Image: regclient-regsync
# Reference: https://images.chainguard.dev/directory/image/regclient-regsync/overview

# Packages NOT in nixpkgs (need custom derivations):
#   regclient-regsync (0.11.0-r0)

# TODO: Implement regclient-regsync image
throw "Image 'regclient-regsync' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "regclient-regsync";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "regclient-regsync";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
